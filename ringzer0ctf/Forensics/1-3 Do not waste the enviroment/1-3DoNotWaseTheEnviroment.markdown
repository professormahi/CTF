##### [1/3 Do no waste enviroment](http://ringzer0team.com/challenges/86)
##### Answer

First we must unzip the file:
```
  $ uz 5bd2510a83e82d271b7bf7fa4e0970d2.zip

  Extracting from  "5bd2510a83e82d271b7bf7fa4e0970d2.zip".
  Archive:  5bd2510a83e82d271b7bf7fa4e0970d2.zip
    inflating: 5bd2510a83e82d271b7bf7fa4e0970d1
```
Now in the next file we can use `strings` command and `egrep` to see the data in the file and search for the flag:  
```
  $ strings 5bd2510a83e82d271b7bf7fa4e0970d1 | egrep -i '.?f.?l.?a.?g.?-' | less
```   
The next flag is in the result:
```
  USERDOMAIN=flag-PC
  COMPUTERNAME=FLAG-PC
  F l a g -=66d7724d872da91af56907aea0f6bfb8
  LOGONSERVER=\\FLAG-PC
  USERDOMAIN=flag-PC
```  
There it is: Flag is `FLAG-66d7724d872da91af56907aea0f6bfb8`

Flags are here to be captured by us ;)
