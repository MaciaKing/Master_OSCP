from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes

# Calculate the MD5 hash of the file using cryptography
def calculate_md5_hash(file_name):
    md5 = hashes.Hash(hashes.MD5(), backend=default_backend())
    with open(file_name, "rb") as file:
        while True:
            data = file.read(8192)
            if not data:
                break
            md5.update(data)
    return md5.finalize().hex()

# Compare the hashes of file_names and find the original one
def MD5_comparation(file_names, original_hash):
    for file_name in file_names:
        calculated_hash = calculate_md5_hash(file_name)
        if calculated_hash == original_hash:
            print(f"{file_name} file is correct.")
        else:
            print(f"{file_name} is not correct. The file has been manipulated.")

if __name__ == '__main__':
    file_names = ["WinMD5.exe", "WinMD5_2.exe"]
    original_hash = "944a1e869969dd8a4b64ca5e6ebc209a"  # Original MD5 hash
    MD5_comparation(file_names, original_hash)