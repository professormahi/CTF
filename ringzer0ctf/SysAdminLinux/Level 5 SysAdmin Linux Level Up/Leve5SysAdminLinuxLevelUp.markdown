##### [Level 5 SysAdmin Linux Level Up](http://ringzer0team.com/challenges/147)
##### Answer
At first moment we must login using ssh:  
```
  ssh morpheus@for01.ringzer0team.com -p 13375
```
Then you asked for password and you will enter `VNZDDLq2x9qXCzVdABbR1HOtz` as a password, Now we must search for files that are owned by `cypher` and are readable for `morpheus`:
```
$ cd /
$ find -user cypher -readble 2> /dev/null
./var/tmp/inf.txt
./var/tmp/mirek.txt
./var/tmp/fl
./var/tmp/lala
```
Now we will search for `flag` between files. In the `mirek.txt` there are some thing that seems it is password. The content is:
```
BASE ?
RkxBRy1weXMzZ2ZjenQ5cERrRXoyaW8wUHdkOEtOego=
```
It seems it a `base 64` encoded string so we decode it using [ringzer0team tools](http://ringzer0team.com/tool) or maybe Linux `base64` command and the result is `FLAG-pys3gfczt9pDkEz2io0Pwd8KNz`.

Keep calm and use Bash :D
