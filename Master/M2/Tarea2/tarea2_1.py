import os
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

class AES:
    def __init__(self):
        self.key = b'12345678901234567890123456789012'
        self.iv = os.urandom(16)
        self.cipher_CBC = Cipher(algorithms.AES(self.key), modes.CBC(self.iv))
        self.cipher_OFB = Cipher(algorithms.AES(self.key), modes.OFB(self.iv))
        self.cipher_CFB = Cipher(algorithms.AES(self.key), modes.CFB(self.iv))
        self.cipher_ECB = Cipher(algorithms.AES(self.key), modes.ECB())

    def crypt_message_CBC(self, message): 
        message_to_bytes = self.transform_to_bytes(message)
        encryptor = self.cipher_CBC.encryptor()
        return encryptor.update(message_to_bytes) + encryptor.finalize()

    def decrypt_message_CBC(self, ciphertext):
        decryptor = self.cipher_CBC.decryptor()
        return decryptor.update(ciphertext) + decryptor.finalize()
    
    def crypt_message_OFB(self, message): 
        message_to_bytes = self.transform_to_bytes(message)
        encryptor = self.cipher_OFB.encryptor()
        return encryptor.update(message_to_bytes) + encryptor.finalize()
    
    def decrypt_message_OFB(self, ciphertext):
        decryptor = self.cipher_OFB.decryptor()
        return decryptor.update(ciphertext) + decryptor.finalize()
    
    def crypt_message_CFB(self, message): 
        message_to_bytes = self.transform_to_bytes(message)
        encryptor = self.cipher_CFB.encryptor()
        return encryptor.update(message_to_bytes) + encryptor.finalize()
    
    def decrypt_message_CFB(self, ciphertext):
        decryptor = self.cipher_CFB.decryptor()
        return decryptor.update(ciphertext) + decryptor.finalize()
    
    def crypt_message_ECB(self, message): 
        message_to_bytes = self.transform_to_bytes(message)
        encryptor = self.cipher_ECB.encryptor()
        return encryptor.update(message_to_bytes) + encryptor.finalize()
    
    def decrypt_message_ECB(self, ciphertext):
        decryptor = self.cipher_ECB.decryptor()
        return decryptor.update(ciphertext) + decryptor.finalize()
    
    def transform_to_bytes(self, message):
        return message.encode('utf-8')

if __name__ == '__main__':
    aes = AES()
    message_to_crypt = "a secret message"
    print("Message to crypt: ",message_to_crypt)
    print("\n***************** CBC Encryption *****************")
    crypted_cbc = aes.crypt_message_CBC(message_to_crypt)
    #print("[Message CBC crypted:", crypted_cbc, " | class of var: ", type(crypted_cbc)," | to_string:", crypted_cbc.decode('utf-8')," ]" )
    print("[Message CBC crypted:", crypted_cbc, " | class of var: ", type(crypted_cbc))
    decryted_cbc = aes.decrypt_message_CBC(crypted_cbc)
    print("[Message CBC decrypted:", decryted_cbc, " | class of var: ", type(decryted_cbc),"]")

    print("\n***************** OFB Encryption *****************")
    crypted_ofb = aes.crypt_message_OFB(message_to_crypt)
    print("[Message OFB crypted:", crypted_ofb, " | class of var: ", type(crypted_ofb),"]")
    decryted_ofb = aes.decrypt_message_OFB(crypted_ofb)
    print("[Message OFB decrypted:", decryted_ofb, " | class of var: ", type(decryted_ofb),"]")
    
    print("\n***************** CFB Encryption *****************")
    crypted_cfb = aes.crypt_message_CFB(message_to_crypt)
    print("[Message CFB crypted:", crypted_cfb, " | class of var: ", type(crypted_cfb),"]")
    crypted_cfb = aes.decrypt_message_CFB(crypted_cfb)
    print("[Message CFB decrypted:", crypted_cfb, " | class of var: ", type(crypted_cfb),"]")

    print("\n***************** ECB Encryption *****************")
    crypted_ecb = aes.crypt_message_ECB(message_to_crypt)
    print("[Message ECB crypted:", crypted_ecb, " | class of var: ", type(crypted_ecb),"]")
    decryted_ecb = aes.decrypt_message_OFB(crypted_ecb)
    print("[Message ECB decrypted:", decryted_ecb, " | class of var: ", type(decryted_ecb),"]")