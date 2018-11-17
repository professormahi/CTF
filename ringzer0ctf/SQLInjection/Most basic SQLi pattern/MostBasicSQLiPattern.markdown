##### [Most basic SQLi pattern](http://ringzer0team.com/challenges/1)
##### Answer
First, We try to guess but it is useless so now we use `'` sign at the end of username and we must reach error:
```
  You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''flag'' AND password = ''' at line 1
```
Yeap, this means the form is vulnerable.  
Now, we try to skip password by using '#' sign that is sql comment and try `flag' or 1=1#` as username and yeah it worked, Hurrrrrrrrrrrray ;)

The `or 1=1` statement make the login resualt true and the flag is `FLAG-238974289383274893`, Go submit flag and have fun ;)
