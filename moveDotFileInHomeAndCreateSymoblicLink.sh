# Shift the dot file into the dot folder, and create a symbolic link
FILE_NAME=$1

if [ ! -f $FILE_NAME ]
then
  echo "$FILE_NAME is not found"
  exit
fi

MOVED_PATH=$HOME/fast/dotfiles/$FILE_NAME
mv $FILE_NAME $MOVED_PATH
ln -s $MOVED_PATH $FILE_NAME

echo "moved file '$FILE_NAME' to '$MOVED_PATH', and created a symbolic link."

