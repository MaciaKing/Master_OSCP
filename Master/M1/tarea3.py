import os, sys

def get_ls_from_path(path):
    return os.listdir(path)

def get_current_user():
    return os.getlogin()

def create_dicc(current_user, path, list_path):
    return {
        'username': current_user,
        'path': path,
        'dir': list_path
    }

if __name__ == "__main__":
    # Decide the path
    if not len(sys.argv) == 2: 
        raise Exception("bin/python tarea3.py <PATH>")
    
    # View if path is a directory
    try:
        path = sys.argv[1]
        os.path.isdir(path)
    except Exception as e:
        print("bin/python tarea3.py <PATH>")

    current_user = get_current_user()
    ls = get_ls_from_path(path)
    final_dicc = create_dicc(current_user, path, ls)
    print(final_dicc)