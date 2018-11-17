##### [Level 6 SysAdmin Linux Level Up](http://ringzer0team.com/challenges/148)
##### Answer
At first moment we must login using ssh:  
```
  ssh morpheus@for01.ringzer0team.com -p 13375
```
Then you asked for password and you will enter `VNZDDLq2x9qXCzVdABbR1HOtz` as a password, Now we wanna search for password of architect so simply we have:  
```
  $ grep 'architect' -R /etc/ 2>/dev/null
  /etc/fstab:#//TheMAtrix/phone  /media/Matrix  cifs  username=architect,password=$(base64 -d "RkxBRy14QXFXMnlKZzd4UERCV3VlVGdqd05jMW5WWQo="),iocharset=utf8,sec=ntlm  0  0
  /etc/init.d/checkroot.sh:		# fail on older kernels on sparc64/alpha architectures due
  /etc/aide/aide.conf.d/10_aide_hostname:if [ -n "$(dpkg --print-architecture)" ]; then
  /etc/aide/aide.conf.d/10_aide_hostname:  echo "@@define ARCH $(dpkg --print-architecture)"
  Binary file /etc/alternatives/cpp matches
  Binary file /etc/alternatives/aptitude matches
  Binary file /etc/alternatives/c++ matches
  Binary file /etc/alternatives/php matches
  Binary file /etc/alternatives/cc matches
  /etc/group:architect:x:1006:
  /etc/rcS.d/S06checkroot.sh:		# fail on older kernels on sparc64/alpha architectures due
  /etc/passwd:architect:x:1006:1006::/home/architect:/bin/bash
```  
It seems architect have used his password for mounting in `fstab` file so the base64 decoded password is `RkxBRy14QXFXMnlKZzd4UERCV3VlVGdqd05jMW5WWQo=`. Simply we must use a [base64 decoder](http://ringzer0team.com/tool) to decode the password and the result is `FLAG-xAqW2yJg7xPDBWueTgjwNc1nVY`.

Submit the flag and drink Iranian tea ;)
