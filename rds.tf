 
resource "tls_private_key" "rsa" {

  algorithm = "RSA"

  rsa_bits  = 4096

}

 

resource "local_file" "TF-key" {

    content  = tls_private_key.rsa.private_key_pem

    filename = "tfkey"

}


