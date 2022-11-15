src:
https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 8000 -subj '/CN=localhost' -nodes

hint:

For anyone else using this in automation, here's all of the common parameters for the subject: -subj "/C=US/ST=Oregon/L=Portland/O=Company Name/OU=Org/CN=www.example.com" –
Alex S
Jun 5, 2015 at 18:13
