#!/bin/bash

if [ -e cscope.in.out ]; then
   rm cscope.in.out
   echo "update cscope.in.out"
else
   echo "new cscope.in.out"
fi

if [ -e cscope.po.out ]; then
   rm cscope.po.out
   echo "update cscope.po.out"
else
   echo "new cscope.po.out"
fi

if [ -e cscope.out ]; then
   rm cscope.out
   echo "update cscope.out"
else
   echo "new cscope.out"
fi

if [ -e cscope.files ]; then
  rm cscope.files
  echo "update cscope.files"
else
  echo "new cscope.files"
fi

if [ -e tags ]; then
  rm tags
  echo "update tags"
else
  echo "new tags"
fi
  
find ./ -name "*.h" -o -name "*.c" -o -name "*.S" > cscope.files
cscope -Rbkq -i cscope.files
ctags -R --exclude=.svn

export CSCOPE_DB=$(pwd)/cscope.out
