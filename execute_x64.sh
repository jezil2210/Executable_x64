#!/bin/bash

if [ "$1" == "-h" ] ; then
    echo 
    echo "Usage:"
    echo  
    echo "-f The name of the file that you wanna compile"
    echo "-e The name of the executable that you wanna create"
    echo 
    echo "Example"
    echo "./execute_x64.sh -f file_to_compile -e name_executable"
    echo  
    exit 0  
fi

# A string with all the options
options=$@
 
# An array with all the arguments
arguments=($options)
 
# Loop index
index=0

for argument in $options
  do
    # Incrementing index
    index=`expr $index + 1`
 
    # The conditions
    case $argument in
      -f) file="${arguments[index]}";;
      -e) executable="${arguments[index]}";;
    esac
  done

nasm -f elf64 -o $executable.o $file
ld $executable.o -o $executable
./$executable
rm $executable.o


