#####[Hey Chuck where is the flag?](http://ringzer0team.com/challenges/44)
#####Answer
As we see the file is `pcap` file and the requests are `http` so we simply export objects in folder.  
![export objects](export.png)
Now in the files we simply search for `FLAG`:
```
  $ grep -R -i flag
  askldj3lkj234.php:Hey this is a flag FLAG-GehFMsqCeNvof5szVpB2Dmjx
```
So the flag is `FLAG-GehFMsqCeNvof5szVpB2Dmjx`

Keep calm and capture the flag :D
