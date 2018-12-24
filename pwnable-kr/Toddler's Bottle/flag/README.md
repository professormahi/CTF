#### pwnable-kr
##### Toddler's Bottle | flag challenge

every time at first run `file` command and after run `strings` command.</br>
in strings output you can see upx file packer address; so just install upx with this command:
```
$ sudo apt-get install upx
```
now just run `upx -d flag` to decompress flag file.</br>
when you run flag it said `I will malloc() and strcpy the flag there. take it.` what you must to do is running this with gdb and put breakpoint before `$eax` deallocated.</br>
run flag file in gdb and see the flag with this `x/s $eax`
