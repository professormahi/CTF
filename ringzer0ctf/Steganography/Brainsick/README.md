####ringzer0team
#####Steganography challenges
######Brainsick
######link: http://ringzer0team.com/challenges/122

Some images are more than one image :D, and this image is so. To find the other file or image in a specific file we can use [foremost](http://foremost.sourceforge.net/) or for image files you can use [binwalk](http://binwalk.org/)

So here it's our lovely image:
```bash
$ binwalk 5411333e505440020a1799da6071851b.gif

  DECIMAL   	HEX       	DESCRIPTION
  -------------------------------------------------------------------------------------------------------
  0         	0x0       	GIF image data, version 8"9a", 440 x 385
  78301     	0x131DD   	RAR archive data
  ```
  As you see we have a RAR file in out lovely image. we can exclude the rar file using `foremost`.
```bash
$ foremost 5411333e505440020a1799da6071851b.gif
Processing: 5411333e505440020a1799da6071851b.gif
  |*|
$ cd output/rar
$ unrar x 00000152.rar
  UNRAR 5.00 beta 8 freeware      Copyright (c) 1993-2013 Alexander Roshal


  Extracting from 00000152.rar

  Extracting  flag.gif                                                  OK
  All OK
```
Oh yes there is flag in the `flag.gif` file ;)  
![flag](flag.gif)

So the flag is: `FLAG-Th2K4s83uQh9xA`

Keep Calm and capture the flag ;)
