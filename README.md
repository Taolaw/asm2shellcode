# asm2shellcode
Convert assembly to shellcode (only linux)

For the time being only for Linux, I hope to get the support of the open source community to make `asm2shellcode` more powerful

## usage:

```bash
asm2shellcode shellcode.S
```

## example

### shellcode for x86

```assembly
.code32
.text
_start:

    xor %ecx, %ecx
    mul %ecx
    pushl %ecx
    push $0x68732f2f
    push $0x6e69622f
    movl %esp, %ebx
    movb $0xb, %al
    int $0x80
```

The x86 assembly is compiled on a 64-bit host, you need to add `.code32` to the header

### result

```bash
$ ./asm2shellcode.sh shellcode_x86.S 
[-] Assembly to Shellcode converter 


[+] Assembling with as ... 
[+] Linking ...

[+] Generating shellcode ...

\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80

[+] Clear ...
[+] Done.

```



### shellcode for x64

```assembly
.text
_start:

    xor %rcx, %rcx
    mul %rcx
    push %rcx
    push $0x68732f2f
    push $0x6e69622f
    mov %rsp, %rbx
    movb $0xb, %al
    int $0x80
```

### result

```bash
[-] Assembly to Shellcode converter 


[+] Assembling with as ... 
[+] Linking ...

[+] Generating shellcode ...

\x48\x31\xc9\x48\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x48\x89\xe3\xb0\x0b\xcd\x80

[+] Clear ...
[+] Done.

```



