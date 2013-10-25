#!/bin/bash

usage()
{
cat << EOF
usage: $0 options

rm all files listed in the file supplied

OPTIONS:
   -h      Show this message
   -f      File with paths to delete

EOF
}

FILELIST=

while getopts “hf:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         f)
             FILELIST=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done


if [[ -z $FILELIST ]]
then
        echo "Missing Variable"
     usage
     exit 1
fi

for file in $(<$FILELIST) ;
do
    echo "rm $file"
    rm $file
done