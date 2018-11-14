#####[I never forget the Nintendo 64](http://ringzer0team.com/challenges/36)
#####Answer

To crack this binary the best way is to change `RAX` at `0x004006EF`(Where the password checks) and then the flag will be appear.  
![cmp](compare.png)  
We will change RAX to RDX value. (`000000006f7499ec`). And the the flag will appear soon.  
![flag](flag.png)  
As you see the flag is `FLAG-6f749f251869912556`.  

Happy capturing new flag :D
