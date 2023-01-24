import pathlib
import argparse
import shutil

parser = argparse.ArgumentParser(
    prog="Copy files from a directory to another",
    description="Copies files from a source directory to a destination directory.")

parser.add_argument("source", type=pathlib.Path, help="Source path")
parser.add_argument("destination", type=pathlib.Path, help="destination path")
args = parser.parse_args()

shutil.copytree(args.path_source, args.path_destination)
