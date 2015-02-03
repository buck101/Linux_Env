#!/bin/bash
CurDir=`pwd`
find $CurDir -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" > cscope.files
cscope -bkq -i cscope.files
ctags -R --c++-kinds=+px --fields=+ialSz --extra=+q $CurDir


