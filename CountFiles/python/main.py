import os

def count_files(start_path):
    ignore_dirs = ['/dev', '/proc', '/run', '/sys']
    file_count = 0
    for root, dirs, files in os.walk(start_path):
        if root in ignore_dirs:
            dirs[:] = []
            continue
        for file_name in files:
            file_path = os.path.join(root, file_name)
            if not os.path.islink(file_path):  # Vérifie si ce n'est pas un lien symbolique
                file_count += 1
    return file_count

num_files = count_files('/')
print("Le nombre total de fichiers dans '/home' est :", num_files)
