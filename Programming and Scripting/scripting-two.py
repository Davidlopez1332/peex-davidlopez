import os
import shutil

def copy_files_recursively(src_dir, dest_dir):
    
    for root, dirs, files in os.walk(src_dir):
        dest_subdir = root.replace(src_dir, dest_dir)
        if not os.path.exists(dest_subdir):
            os.makedirs(dest_subdir)

        for file in files:
            src_path = os.path.join(root, file)
            dest_path = os.path.join(dest_subdir, file)
            shutil.copy(src_path, dest_path)

