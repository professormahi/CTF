#####[Did you see my desktop](http://ringzer0team.com/challenges/87)
#####Answer

First we must unzip the file:
```
  $ uz 5bd2510a83e82d271b7bf7fa4e0970d2.zip

  Extracting from  "5bd2510a83e82d271b7bf7fa4e0970d2.zip".
  Archive:  5bd2510a83e82d271b7bf7fa4e0970d2.zip
    inflating: 5bd2510a83e82d271b7bf7fa4e0970d1
```
Now in the next file we can use `strings` command to see the data in the file and search for the flag:  
```
  $ strings 5bd2510a83e82d271b7bf7fa4e0970d1 | less
```   
And search for flag `/flag` in the `less` enviroment, finally we find:  
```
  "C:\Windows\system32\NOTEPAD.EXE" C:\Users\flag\Desktop\F$L%A^G-5bd2510a83e82d271b7bf7fa4e0970d1.txt
  G5u #
  ase@CallstackTracker@DirectUI@@AAE_KPAX_K@Z
  ?GetMouseFocused@Element@DirectUI@@QAE_NXZ
  ?GetMouseWithin@Element@DirectUI@@QAE_NXZ
  ?GetMouseWithinChild@Element@DirectUI@@QAEPAV12@XZ
  ?GetMultiline@Edit@DirectUI@@QAE_NXZ
  ?GetName@ClassInfoBase@DirectUI@@UBEPBGXZ
```  
There it is: Flag is `FLAG-5bd2510a83e82d271b7bf7fa4e0970d1`

Keep calm and capture your life's falgs ;)
