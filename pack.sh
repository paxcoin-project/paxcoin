#!/bin/sh
coin=paxcoin
version=1.0.0
platform=`uname -a | awk '{print tolower($1)}'`
arch=`uname -m`

if test "${platform}" = "linux" ; then
    if test "${arch}" = "x86_64" ; then
        tarball_name="bitcoin-${version}-linux64.tar.gz"
    elif test "${arch}" = "x86_32" ; then
        tarball_name="bitcoin-${version}-linux32.tar.gz"
    fi
elif test "${platform}" = "darwin" ; then
    tarball_name="bitcoin-${version}-osx64.tar.gz"
else
    echo "Bitcoin binary distribution not available for platform and architecture"
    exit -1
fi
bitcoin_dir=paxcoin-${version}
rm -Rf tmp/*
rm -Rf ${tarball_name}

mkdir -p tmp/${bitcoin_dir}/bin

cp src/${coin}-cli          tmp/${bitcoin_dir}/bin/${coin}-cli
cp src/${coin}-tx           tmp/${bitcoin_dir}/bin/${coin}-tx
cp src/${coin}d             tmp/${bitcoin_dir}/bin/${coin}d
cp src/test/test_bitcoin    tmp/${bitcoin_dir}/bin/test_${coin}
cp src/wallet-utility       tmp/${bitcoin_dir}/bin/
cp src/qt/${coin}-qt        tmp/${bitcoin_dir}/bin/${coin}-qt
cp ${coin}.conf             tmp/${bitcoin_dir}/bin/${coin}.conf
cd tmp
tar -zcvf ../${tarball_name} ./
cd ../
