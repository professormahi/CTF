##### [Security through obscurity!](http://ringzer0team.com/challenges/45)
##### Answer

As you see The message is `You don't have admin access.` and there is cookie named `AUTH` like:  
```
Z3Vlc3QsYThmMTBmMWNlNGUxZjQ0YywxNDMzMzE2OTY0LGZhbHNlOjkyYjIzNGMzYzVkNDhlNDExOTE4YmNiMjNkNTAzZjA1
```
It seems the cookie value is `base64` encoded so we [decode](http://ringzer0team.com/tool)it and the result is :  
```
guest,a8f10f1ce4e1f44c,1433316964,false:92b234c3c5d48e411918bcb23d503f05
```
So as you see it have some parts that are separated with a `,`; The parts are:  

* `guest`; we must change it to `admin`  
* `a8f10f1ce4e1f44c`; It seems it is a random value
* `1433316964`; It's expire time it `Unix Time Stamp`
* `false`; we will change it to `true`
* `:92b234c3c5d48e411918bcb23d503f05`; This part is `MD5` of first part of the string

Now we will create our cookie we need to change `guest` to `admin` and Then we'll change `Time stamp` to another time (e.g. 01/01/2016 12:00:00 AM) using a [Converter](:92b234c3c5d48e411918bcb23d503f05). (The result is 1451606400). Then we change `false` to `true`.  
Now we'll `MD5` first part to make second one. The result is:  
```
admin,a8f10f1ce4e1f44c,1451606400,true:5e5c01cf88a804b51d2a9483d4ee2c47
```
Now encode it as `base64` and use a [Cookie editor](https://www.google.com/search?safe=active&espv=2&q=Edit+cookie+extension&spell=1&sa=X&ei=BrJuVZfPDKPXyQOrj4GQCQ&ved=0CBoQvwUoAA&biw=1325&bih=657) to change `AUTH` value and expire time.
![change](edit.png)  
Then the flag will appear:  
```
FLAG-Feg03OSzWhxO03K94108100f
```

Keep calm and capture more flags :D
