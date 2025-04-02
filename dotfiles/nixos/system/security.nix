{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    openssl
  ];

  security.rtkit.enable = true;
# openssl s_client -connect server.home:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBwDCCAWagAwIBAgIRALGemIvgJcC1EZiaVt15HPYwCgYIKoZIzj0EAwIwMzEx
      MC8GA1UEAxMoQ2FkZHkgTG9jYWwgQXV0aG9yaXR5IC0gRUNDIEludGVybWVkaWF0
      ZTAeFw0yNTA0MDIyMjA2NTVaFw0yNTA0MDMxMDA2NTVaMAAwWTATBgcqhkjOPQIB
      BggqhkjOPQMBBwNCAATsE18tx6sRq0o20UR5JFr4xjx1wij5TqUVJneiE8mb6uKR
      6gUZ9ZYU1CjuJzlzJb8uKrC3s243EfUH1yM7/VE2o4GNMIGKMA4GA1UdDwEB/wQE
      AwIHgDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwHQYDVR0OBBYEFGEe
      c0KBJ2GkJgvZtn7w3kXZ9ghaMB8GA1UdIwQYMBaAFA2XKRKTqZTxAvBc/sh4EoW/
      ji3tMBkGA1UdEQEB/wQPMA2CC3NlcnZlci5ob21lMAoGCCqGSM49BAMCA0gAMEUC
      IFghdRMEy1t2IXV00dlZIwWfn6Mdeuhm6RxiRHbQahZHAiEA4SfarpvhXGtvE/fA
      3YbElMreWwZ9x4gtJtFhA3qrjHY=
      -----END CERTIFICATE-----
    ''
  ];
}
