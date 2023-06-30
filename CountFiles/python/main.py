import os 

def list_files(start_path):
    ignore_dirs = ['/dev', '/proc', '/run', '/sys']
    with open('resultat.txt', 'w') as f:
        for root, dirs, files in os.walk(start_path):
            if root in ignore_dirs:
                dirs[:] = [] 
                continue
            for file in files:
                f.write(os.path.join(root,file) + '\n')

list_files('/')