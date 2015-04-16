#####[Words mean something?](http://ringzer0team.com/challenges/42)
#####Answer
In the network tab of inspector we can see `flag` parameter in the cookies that is 0.
So it seems we must change it to `1` to see the flag.

For that we must use a cookie editor to change cookies such as [Edit this cookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en), [Burp suite](http://portswigger.net/burp/), and etc.  
After changing flag parameter and reloading we have the flag. `FLAG-AnlAb6QxDpQvg1yn2bAhyOJw`.

Don't use cookies for important things. They are just for eating with tea :D
