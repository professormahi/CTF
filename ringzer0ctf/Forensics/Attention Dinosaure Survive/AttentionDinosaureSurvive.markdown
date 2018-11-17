##### [Attention Dinosaure Survive](http://ringzer0team.com/challenges/92)
##### Answer
As you see the file has extension `E01` and the file is `EnCase Image` file. So we must use xmount to mount this image.First we must install `xmount`
```
  $ sudo apt-get install xmount -y
```
Now we must mount the `E01` file:
```
$ mkdir mountpoint
$ sudo xmount --in ewf 0b02119984a7cee0ba83d55425b9491f.E?? mountpoint/
```
So it makes files in the `mountpoint`. Now there is a `dd` file in the `mountpoint` folder that when we mount that the files are there.
But we don't mount that and we do use `strings` command:
```
  $ strings 0b02119984a7cee0ba83d55425b9491f.dd | grep -i flag
  /Flags 262176
  /Flags 262240
  /Flags 96
  /Flags 32
  flag-pc
  flag-6b96e212b3f85968db654f7892f06122
  flag-6b96e212b3f85968db654f7892f06122
  flag-6b96e212b3f85968db654f7892f06122
```
So the flag is `flag-6b96e212b3f85968db654f7892f06122`.

Eat Iranian tea while capturing the flag :D
