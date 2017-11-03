#!/bin/sh
timestamp=$( date +%Y%m%d-%H%M%S )
datadir=data
corename=paxcoin
echo $timestamp
cp ${datadir}/wallet.dat ./wallet.dat.$timestamp
cp ${datadir}/${corename}.conf ./${corename}.conf.$timestamp
 
rm -Rf ${datadir}/*
cp *.conf ${datadir}/
cp ./wallet.dat.$timestamp ${datadir}/wallet.dat
mv ./${corename}.conf.$timestamp ${datadir}/${corename}.conf 