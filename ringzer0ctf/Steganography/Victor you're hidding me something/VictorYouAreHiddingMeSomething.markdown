##### [Victor you're hidding me something](http://ringzer0team.com/challenges/70)
##### Answer
As you see the first char of 4 first lines make `FLAG`.  
So we will write a code to make the flag:
```
$ echo "The Poem" > in
$ cat in | cut -c-1 | tr -d '\n'
FLAGCMPHDDSQNUCCPNNSOQACJOOP
```
So the flag is `FLAGCMPHDDSQNUCCPNNSOQACJOOP`.

Happy submitting flag :D
