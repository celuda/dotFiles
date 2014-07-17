# This would try to install the vim plugins saved in the 'vim_plugin_on_github'file

f = open("vim_plugin_on_github")

import sys, subprocess, os, os.path as path
from subprocess import call

# Check folder existance
homeFolder = os.environ['HOME']
vimFolder = "%s/.vim" % homeFolder

bundleFolder = "%s/bundle" % vimFolder
autoloadFolder = "%s/autoload" % vimFolder

pathogenAutoloadFilePath = "%s/pathogen.vim" % autoloadFolder


def makeSureDirectoryExists(dir_fullpath):
  if not path.exists(dir_fullpath):
    os.makedirs(dir_fullpath)

makeSureDirectoryExists(bundleFolder)
makeSureDirectoryExists(autoloadFolder)

# pathogen file
pathogenFile = "%s/pathogen.vim" % autoloadFolder
if not path.isfile(pathogenFile):
  call(['wget','-O',pathogenFile,"https://tpo.pe/pathogen.vim"])

# Install Color Scheme plugin
colorFolder = "%s/colors" % vimFolder
makeSureDirectoryExists(colorFolder)
colorFIle = "%s/wombat256mod.vim" % colorFolder
if not path.isfile(colorFIle):
  call(['wget','-O',colorFIle,
    "http://www.vim.org/scripts/download_script.php?src_id=13400"
  ])


if not path.isfile(pathogenAutoloadFilePath):
  call(['curl','-Sso',pathogenAutoloadFilePath,
    "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
  ])

for l in f:
  l = l.strip()
  if not (l.startswith('http') or l.startswith('git')):
    continue

  basename = path.basename(l)
  folderName = (path.splitext(basename))[0]
  
  gitCheckoutFolder = "%s/%s" % (bundleFolder,folderName)

  if path.exists(gitCheckoutFolder):
    continue
  
  if call(["git","clone",l,gitCheckoutFolder]):
    print "Error Occured. Message see above"
  else:
    print basename,"installed."

print "Done :)"
