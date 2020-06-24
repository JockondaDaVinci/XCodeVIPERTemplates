#!/bin/bash
ndir="~/Library/Develiper/Xcode"
ntemp="Templates"
nf="File Templates"
np="Project Templates"
cd $ndir

echo "Looking for \"$ntemp\" folder in your XCode directory..."
if [ -d "$ndir/$ntemp" ]; then
echo "\"$ntemp\" found, copying VIPER..."
else
echo "\"$ntemp\" does not found, creating required directories..."
`mkdir $ntemp`
echo "\"$ntemp\" created..."
cd "$ndir/$ntemp"
fi
if [ ! -d "$ndir/$ntemp/$nf" ]; then
echo "\"$nf\" does not found, creating..."
`mkdir File\ Templates`
echo "\"$nf\" created..."
fi
if [ ! -d "$ndir/$ntemp/$np" ]; then
echo "\"$np\" does not found, creating..."
`mkdir Project\ Templates`
echo "\"$np\" created..."
fi
echo "Directories existing..."

echo "Copying files to temporary folder..."
cd "$ndir/$ntemp"

git clone https://github.com/JockondaDaVinci/XCodeVIPERTemplates.git gittmp
echo "Copying files to directores..."
cp -r -v "$ndir/$ntemp/gittmp/$nf/" "$ndir/$ntemp/$nf"
cp -r -v "$ndir/$ntemp/gittmp/$np/" "$ndir/$ntemp/$np"

cd "$ndir/$ntemp"
rm -rf gittmp

exit 0
