from base64 import encode
import crypt
import sys

if len(sys.argv) != 2:
    print("Error: please enter password to encrypt as 1st argument.")
    exit()

toCrypt = sys.argv[1]

print('trying to crypt: ' + toCrypt)

password = crypt.crypt(toCrypt, crypt.mksalt())

print("Generated hash:")
print(password)
