#! /bin/bash
OLDCWD=`pwd`
SCRIPT_PATH=`dirname $0`
cd $SCRIPT_PATH/../../

nl='
'
nl=$'\n'
FILES=`find $CHECK_PATH -type f \( \( -name \*.inc -a \! -name Makefile.inc \) -o -name \*.cfg -o -name \*.c -o -name \*.s -o -name \*.h -o -name \*.asm -o -name \*.sgml \) -print | while read f; do
    t=$(tail -c2 $f; printf x); r1="${nl}$";
    [[ ${t%x} =~ $r1 ]] || echo "$f"
done`

cd $OLDCWD

if [ x"$FILES"x != xx ]; then
    echo "error: found following files that have no newline at the end:"
    for n in $FILES; do
        echo $n
    done
    exit -1
fi