#####[Level 1 SysAdmin Linux Level Up](http://ringzer0team.com/challenges/89)
#####Answer
At first moment we must login using ssh:  
```
  ssh morpheus@for01.ringzer0team.com -p 13375
```
Then you asked for password and you will enter `VNZDDLq2x9qXCzVdABbR1HOtz` as a password, Now we wanna search for password of trinity so simply we have:  
```
  $ grep 'trinity' -R /etc/ 2>/dev/null
  /etc/rc.local:nohup /root/backup.sh -u trinity -p Flag-08grILsn3ekqhDK7cKBV6ka8B &
  /etc/group:trinity:x:1002:
  /etc/passwd:trinity:x:1002:1002:trinity,,,:/home/trinity:/bin/bash
```  
It seems trinity have used his password for running backup.sh so the password and flag is `Flag-08grILsn3ekqhDK7cKBV6ka8B`.  

Happy [Nowruz](http://en.wikipedia.org/wiki/Nowruz) ;)
