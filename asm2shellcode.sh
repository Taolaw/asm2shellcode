#!/bin/bash
echo '[-] Assembly to Shellcode converter '
echo ''
echo ''
echo '[+] Assembling with as ... '
as -o $1.o $1
echo '[+] Linking ...'
ld -s -o $1.bin $1.o
echo ''
echo '[+] Generating shellcode ...'
for i in $(objdump -d ./$1.bin |grep "^ " |cut -f2); do echo -n '\x'$i >> sc.txt; done; echo
cat sc.txt
echo''
echo''
echo '[+] Clear ...'
rm $1.o $1.bin sc.txt
echo '[+] Done.'
