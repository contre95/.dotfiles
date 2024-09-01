{ ... }:
{
  # openssl s_client -connect <your-server-url>:443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM > server_cert.pem
  security.rtkit.enable = true;
}
