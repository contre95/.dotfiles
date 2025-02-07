{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    openssl
  ];

  security.rtkit.enable = true;
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBpDCCAUqgAwIBAgIRAIHxoPlrvKIDe2p9xa4JyVAwCgYIKoZIzj0EAwIwMDEu
      MCwGA1UEAxMlQ2FkZHkgTG9jYWwgQXV0aG9yaXR5IC0gMjAyNCBFQ0MgUm9vdDAe
      Fw0yNDA5MDgwMjEyMDFaFw0zNDA3MTgwMjEyMDFaMDAxLjAsBgNVBAMTJUNhZGR5
      IExvY2FsIEF1dGhvcml0eSAtIDIwMjQgRUNDIFJvb3QwWTATBgcqhkjOPQIBBggq
      hkjOPQMBBwNCAATlRudHbyrrHsbPlieQn9Jsm+3E1rTx8seoqroC4zAnuvT1Rnkz
      bkHYoH5Yqm+U88oFFvv9UazN1rYfQi3DGPOSo0UwQzAOBgNVHQ8BAf8EBAMCAQYw
      EgYDVR0TAQH/BAgwBgEB/wIBATAdBgNVHQ4EFgQUFxGMp2jlbhs4gCNrCztlXbJi
      QekwCgYIKoZIzj0EAwIDSAAwRQIhAKXqTdwu1KlegREvKWOWbNKstmwgADfwSwno
      KBzRe5FJAiAgGVlng9FDrihC4oImL9o8VQ1tUAf8GCdPxL4bCtc7MQ==
      -----END CERTIFICATE-----
    ''
  ];

}
