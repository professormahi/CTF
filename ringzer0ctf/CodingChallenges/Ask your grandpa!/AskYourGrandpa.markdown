#####[Ask your grandpa!](http://ringzer0team.com/challenges/172)
#####Answer

We can easily search the picture at `google` and understand that the image is from a [Punch Card](https://en.wikipedia.org/wiki/Punched_card). And we reach a table that can help us to convert the punch card to text:  
```
Punch Card Table
     ______________________________________________  
   /&-0123456789ABCDEFGHIJKLMNOPQR/STUVWXYZ  
Y / x           xxxxxxxxx  
X|   x                   xxxxxxxxx  
0|    x                           xxxxxxxxx  
1|     x        x        x        x  
2|      x        x        x        x  
3|       x        x        x        x  
4|        x        x        x        x  
5|         x        x        x        x  
6|          x        x        x        x  
7|           x        x        x        x  
8|            x        x        x        x  
9|             x        x        x        x  
 |________________________________________________  
```
So now we can match the punch card manually and reach the result or we can write a program to read the image and results the text.  
I have written a `matlab` [code](PunchCardReader.m) that do such. After runing the programm we can see the flag:
```
FLAG-B493801CDB-831ABDDFA628AC31
```

Happy capturing the flag. See [this video](https://www.youtube.com/watch?v=KG2M4ttzBnY) to understand how awesome the Punch Card is. ;)
