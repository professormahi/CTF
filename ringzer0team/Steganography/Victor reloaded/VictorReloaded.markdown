#####[Victor reloaded](http://ringzer0team.com/challenges/71)
#####Answer

The original poem is from `Victor Hugo` that you can find the poem [here](http://poesie.webnet.fr/lesgrandsclassiques/poemes/victor_hugo/viens_une_flute_invisible.html). As you see the poem is different from what we have. So we'll write a `script` to show us the changes.  
We have two files named `original.txt` and `fake.txt`. First we'll split both files characters and remove some spaces:  
```
$ cat original.txt | tr -d ' \t\n' | fold -1 > original-folded.txt
$ cat fake.txt | tr -d ' \t\n' | fold -1 > fake-folded.txt
```
Now use `diff` to see the difference:  
```
$ diff original-folded.txt fake-folded.txt -y --suppress-common-lines | cut -c1 | tr -d ' \n\t';echo

  flagarenice
```
As you see the flag is `flagarenice`.

[Victor Hugo](http://en.wikipedia.org/wiki/Victor_Hugo) says: "To love is to act". Other flags are waiting for you ;)
