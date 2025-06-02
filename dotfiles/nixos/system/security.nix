{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    openssl
  ];

  security.rtkit.enable = true;
  # Leaf certificate # openssl s_client -connect server.home:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text
  # Root CA #  curl -s "http://server.home:2019/pki/ca/local" | jq -r '.root_certificate' > caddy-root.crt
    environment.etc."pkcs11/modules/onepin-opensc-pkcs11".text = ''
    module: ${pkgs.opensc}/lib/onepin-opensc-pkcs11.so
    critical: yes
  '';
  

  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBpDCCAUqgAwIBAgIRAIp1NvndtzJakxQnNDmuCy0wCgYIKoZIzj0EAwIwMDEu
      MCwGA1UEAxMlQ2FkZHkgTG9jYWwgQXV0aG9yaXR5IC0gMjAyNSBFQ0MgUm9vdDAe
      Fw0yNTA0MDIyMjA2NTVaFw0zNTAyMDkyMjA2NTVaMDAxLjAsBgNVBAMTJUNhZGR5
      IExvY2FsIEF1dGhvcml0eSAtIDIwMjUgRUNDIFJvb3QwWTATBgcqhkjOPQIBBggq
      hkjOPQMBBwNCAATChJxbVjC+cLi+4hl3hTfo8yFSTWdRl3IGAYSicv+dlXAIQ4ZL
      XxTlvIEkPxvWwRcIq7mYsVEO9VTzIIiE00XJo0UwQzAOBgNVHQ8BAf8EBAMCAQYw
      EgYDVR0TAQH/BAgwBgEB/wIBATAdBgNVHQ4EFgQUk9zWGupf/ca5wOSuzos37LRa
      790wCgYIKoZIzj0EAwIDSAAwRQIhAOIo695yzPcsviUko6k48lsYu/LvfSvQv21G
      obb+QuBwAiAJmOGAop26OqVx3xsWurOThepCIxr5o1XF5uk/8uTqfQ==
      -----END CERTIFICATE-----
    ''
  ];
}
