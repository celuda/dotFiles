# Shift the dot file into the dot folder, and create a symbolic link

import sys
import shutil
import os
import os.path as path

filepath = sys.argv[1]
homeforder = os.environ['HOME']

if not path.isabs(filepath):
  filepath = "%s/%s" % (homeforder,filepath)

if not path.isfile(filepath):
  print "file",filepath,"doesn't exist."
  sys.exit(1)

if path.islink(filepath):
  print "There's no point moving a symbolic link into this git folder"
  sys.exit(1)

thisFolder = path.dirname(path.realpath(__file__))

basename = path.basename(filepath)
moved_path = "%s/%s" % (thisFolder,basename)
shutil.move(filepath,moved_path)
os.symlink(moved_path,filepath)

# Move to moved_path, allow overwrite
print "File moved to ",moved_path,  \
      ", and created a symbolic link at: ", filepath
