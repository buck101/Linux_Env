#!/bin/bash
CurDir=`pwd`
TagDir=$CurDir/tags
mkdir -p $TagDir
rm -rf $TagDir/*
cd $TagDir
find $CurDir/src -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.java" > cscope.files
cscope -bkq -i cscope.files
ctags -R --c++-kinds=+px --fields=+ialSz --extra=+qf $CurDir/src


