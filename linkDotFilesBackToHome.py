# THis file would try to link files back to home folder
# For the .bashrc, it would try to make `~/.hashrc` to source this file

import os
import os.path as path
import sys

homeFolder = os.environ['HOME']

backupFoldr = homeFolder + "/.bak"
if not path.isdir(backupFoldr):
  os.mkdir(backupFoldr,0700)
  print "created folder."

files = [f for f in os.listdir('.') 
    if f.startswith('.') and path.isfile(f) and f != '.bashrc']

for f in files:
  fpair = path.splitext(f)
  if fpair[1] != "" and fpair[1] != ".conf":
    continue

  # Move the file into folder on existance
  linkToPath = "%s/%s" % (homeFolder,f)
  if path.exists(linkToPath):
    backupFileName = "%s/%s" % (backupFoldr, f)
    os.rename(linkToPath,backupFileName)

  fileFullPath = path.abspath(f)
  os.symlink(fileFullPath,linkToPath)
  print "done for file: ", f
