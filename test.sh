import requests
import xml.etree.ElementTree as ET
import argparse
import sys
from urllib3.exceptions import InsecureRequestWarning

# Disable SSL warnings (use only for testing with self-signed certs)
requests.packages.urllib3.disable_warnings(category=InsecureRequestWarning)

def get_existing_mappings(api_url, api_key, api_secret, interface):
    """Fetch existing static DHCP mappings for an interface."""
    url = f"{api_url}/api/dhcpd/lease/get/{interface}"
    try:
        response = requests.get(
            url,
            auth=(api_key, api_secret),
            verify=False
        )
        response.raise_for_status()
        data = response.json()
        return data.get('dhcpd', {}).get(interface, {}).get('staticmap', [])
    except Exception as e:
        print(f"Error fetching existing mappings: {e}")
        sys.exit(1)

def add_static_mapping(api_url, api_key, api_secret, interface, mapping):
    """Add a static DHCP mapping via OPNsense API."""
    url = f"{api_url}/api/dhcpd/lease/addStaticMapping"
    data = {
        "interface": interface,
        **mapping  # Include all extracted XML fields
    }
    try:
        response = requests.post(
            url,
            auth=(api_key, api_secret),
            data=data,
            verify=False
        )
        response.raise_for_status()
        result = response.json()
        if result.get('status') == 'saved':
            print(f"Added: {mapping['mac']} -> {mapping['ipaddr']}")
        else:
            print(f"Failed to add {mapping['mac']}: {result.get('message', 'Unknown error')}")
    except Exception as e:
        print(f"Error adding mapping: {e}")

def parse_staticmaps(xml_content):
    """Parse XML content into a list of static mapping dictionaries."""
    try:
        # Wrap in root tag if needed
        wrapped_xml = f"<root>{xml_content}</root>"
        root = ET.fromstring(wrapped_xml)
        mappings = []
        for staticmap in root.findall('staticmap'):
            mapping = {}
            for child in staticmap:
                # Handle empty tags (use empty string)
                mapping[child.tag] = child.text if child.text is not None else ''
            mappings.append(mapping)
        return mappings
    except ET.ParseError as e:
        print(f"XML parsing error: {e}")
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description='Add static DHCP mappings to OPNsense')
    parser.add_argument('--url', required=True, help='OPNsense base URL (e.g., https://192.168.1.1)')
    parser.add_argument('--key', required=True, help='API key')
    parser.add_argument('--secret', required=True, help='API secret')
    parser.add_argument('--interface', default='lan', help='Interface (e.g., lan, opt1)')
    parser.add_argument('--file', required=True, help='Path to XML file containing staticmap entries')
    args = parser.parse_args()

    # Read XML content from file
    try:
        with open(args.file, 'r') as f:
            xml_content = f.read()
    except IOError as e:
        print(f"Error reading file: {e}")
        sys.exit(1)

    # Parse XML into mappings list
    new_mappings = parse_staticmaps(xml_content)
    if not new_mappings:
        print("No valid static mappings found in XML.")
        sys.exit(1)

    # Fetch existing mappings to avoid duplicates
    existing_mappings = get_existing_mappings(args.url, args.key, args.secret, args.interface)

    # Track added/existing mappings
    added_count = 0
    for mapping in new_mappings:
        mac = mapping['mac']
        ipaddr = mapping['ipaddr']

        # Skip if MAC or IP already exists
        if any(m.get('mac') == mac or m.get('ipaddr') == ipaddr for m in existing_mappings):
            print(f"Skipped duplicate: {mac} ({ipaddr})")
            continue

        # Add new mapping
        add_static_mapping(args.url, args.key, args.secret, args.interface, mapping)
        added_count += 1

    print(f"\nComplete! Added {added_count} new mappings.")

if __name__ == "__main__":
    main()
