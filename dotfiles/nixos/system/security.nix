{ ... }:
{
  # openssl s_client -connect <your-server-url>:443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM > server_cert.pem
  security.rtkit.enable = true;
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBwTCCAWagAwIBAgIQO/FZou+fk5O2l4PTbySTuzAKBggqhkjOPQQDAjAzMTEw
      LwYDVQQDEyhDYWRkeSBMb2NhbCBBdXRob3JpdHkgLSBFQ0MgSW50ZXJtZWRpYXRl
      MB4XDTI0MDgyOTE4NDY1N1oXDTI0MDgzMDA2NDY1N1owADBZMBMGByqGSM49AgEG
      CCqGSM49AwEHA0IABCUPBTtQhRVhYoGRkt5roI4wesUdxWznlvPeJ9XSeWu3mqzg
      sDzCrkRTPN5z7KlEQ63cYp3n8OMuT8MWsvwCGnujgY4wgYswDgYDVR0PAQH/BAQD
      AgeAMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAdBgNVHQ4EFgQUwdlt
      T6RtITm6TwXgyfQMDZwa8/cwHwYDVR0jBBgwFoAURQoHbDsS+QelWDBPlNStrBwd
      Ew4wGgYDVR0RAQH/BBAwDoIMY29udHJlLmx1Y2FzMAoGCCqGSM49BAMCA0kAMEYC
      IQCnVmyqU0JaA0HBuUaSc7xh9GEFgIum+5q5OjQd2LIJiQIhAIs0VlaMHw3K+xgW
      1SHzliOEYtJpy7J/isUth6rILw9J
      -----END CERTIFICATE-----
    ''
  ];
}
