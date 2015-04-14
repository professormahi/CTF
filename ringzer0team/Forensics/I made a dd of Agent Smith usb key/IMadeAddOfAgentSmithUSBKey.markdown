#####[I made a dd of Agent Smith usb key](http://ringzer0team.com/challenges/20)
#####Answer

Here is a 'dd' backup. first we see the contents using `strings` command and search for 'FLAG':
```
  $ strings 86b265d37d1fc10b721a2accae04a60d | grep FLAG
  FLAG-ggmgk05096
```
So the flag is `FLAG-ggmgk05096`.

Happy flag capturing:D
Keep calm and CTF!
