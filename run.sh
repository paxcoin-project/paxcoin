#!/bin/sh
coin=paxcoin
version=1.0.0
platform=`uname -a | awk '{print tolower($1)}'`

platform2=`uname -r`
arch=`uname -m`
ext=
# options
#options="-debug=1 -reindex"
options=" -debug=1"
printc=

if test "${platform}" = "linux"  || test "${platform}" = "Linux" ; then
    printc='-printtoconsole'
    ext=''
    if [ "${platform2}"=="4.4.0-43-Microsoft" ]; then
        ext='.exe'
    fi
elif test "${platform}" = "darwin" ; then
    printc='-printtoconsole'
    ext=''
else
    printc=''
    ext='.exe'
fi

src/qt/paxcoin-qt${ext} -datadir=./data  ${printc} ${options}

