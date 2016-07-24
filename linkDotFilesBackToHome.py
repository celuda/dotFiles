# THis file would try to link files back to home folder
# For the .bashrc, it would try to make `~/.hashrc` to source this file

import os
import os.path as path

homeFolder = os.environ['HOME']

backupFoldr = homeFolder + "/.bak"
if not path.isdir(backupFoldr):
  os.mkdir(backupFoldr, 0o700)
  print("created folder.")

files = [f for f in os.listdir('.') \
         if f.startswith('.') and path.isfile(f) and f != '.bashrc']

for f in files:
  fpair = path.splitext(f)
  if fpair[1] != "" and fpair[1] != ".conf":
    continue

  linkToPath = "%s/%s" % (homeFolder,f)

  # If this is a link, then simply update it, by removing it first
  if os.path.islink(linkToPath):
    os.remove(linkToPath)

  # Move the file into folder on existance
  if path.exists(linkToPath):
    backupFileName = "%s/%s" % (backupFoldr, f)
    os.rename(linkToPath,backupFileName)
    os.remove(linkToPath)


  fileFullPath = path.abspath(f)
  print("full path: ", fileFullPath)
  print("link to path: ", linkToPath)
  os.symlink(fileFullPath, linkToPath)
  print("done for file: ", f)
