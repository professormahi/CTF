##### [Look inside the house](http://ringzer0team.com/challenges/18)
##### Answer

To capture this flag it's enough to find the file that has been stored inside the image. To do so we will use applications like `steghide`.  
To install `steghide`:
```
  $ sudo apt-get install steghide
```
Then we use the application to find the flag:(Leave passphrase empty)
```
$ steghide extract -sf 3e634b3b5d0658c903fc8d42b033fa57.jpg
  Enter passphrase:
  wrote extracted data to "flag.txt".
$ ls
  3e634b3b5d0658c903fc8d42b033fa57.jpg  flag.txt
$ cat flag.txt
  FLAG-5jk682aqoepoi582r940oow
```
So the flag is `FLAG-5jk682aqoepoi582r940oow`.  

No we can drink a cup of Iranian tea. :D
