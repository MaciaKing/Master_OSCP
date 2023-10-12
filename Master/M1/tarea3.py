import os, sys

def get_ls_from_path(path):
    return os.listdir(path)

def get_current_user():
    return os.getlogin()

def get_current_path():
    return os.path.realpath(__file__)

def create_dicc(current_user, path, list_path):
    return {
        'username': current_user,
        'path': path,
        'dir': list_path
    }

if __name__ == "__main__":
    current_user = get_current_user()
    # Decide the path
    if len(sys.argv) > 1: 
        path = sys.argv[1]
        if not os.path.isdir(path):
            raise Exception(path+": not found directory")
    else:
        path = get_current_path()
    ls = get_ls_from_path(path)
    final_dicc = create_dicc(current_user, path, ls)
    print(final_dicc)