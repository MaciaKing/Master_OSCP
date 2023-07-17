from Crypto.Hash import SHA1, MD5, SHA256
import sys

def crypt_sha256(word_to_crypt):
    hash_object = SHA256.new(data=word_to_crypt.encode())
    hex_dig = hash_object.hexdigest()
    return hex_dig

def crypt_sha1(word_to_crypt):
    sha1_hash = SHA1.new(word_to_crypt.encode()).hexdigest()
    return sha1_hash

def crypt_md5(word_to_crypt):
    md5_hash = MD5.new(word_to_crypt.encode()).hexdigest()
    return md5_hash

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python tarea2.py <archivo>")
        exit(1)

    with open(sys.argv[1], 'r') as file:
        for line in file:
            print("Word to crypt:",line.strip(), "|| Word crypted using SHA1:", crypt_sha1(line.strip()),   
                  "|| Word crypted using crypt_md5:", crypt_md5(line.strip()) )  # Imprimir la línea (sin espacios en blanco al inicio o final)
            # Save word crypted to file
            with open("crypted256.txt", 'a') as file_crypted:
                file_crypted.write(crypt_sha1(line.strip()) + "\n")
                file_crypted.close()
            with open("cryptedMD5.txt", 'a') as file_crypted:
                file_crypted.write(crypt_md5(line.strip()) + "\n")
                file_crypted.close()