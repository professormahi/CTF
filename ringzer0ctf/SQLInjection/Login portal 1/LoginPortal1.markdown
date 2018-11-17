##### [Login portal 1](http://ringzer0team.com/challenges/3)
##### Answer
In this login portal we can add `admin'` as username and the result `Wrong username / password.` but we are hopeful :D and we use `admin' or 1=1` as a input but the result is `Illegal characters detected.`

Are we hopeless? Nope we can add `admin' or 1` and we got `Wrong username / password.`. In the last try we use `admin' or 1 or'` and the result is awesome:
```
FLAG-4f885o1dal0q1huj6eaxuatcvn
```
As you now the query was some thing like bellow:
```
SELECT * FROM sometable WHERE user='$user' AND PASS='$PASS'
```
So the last `'` make the password part of query an sting :D

Keep calm and continue capturing the flag.
