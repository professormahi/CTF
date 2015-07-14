###HARD INTERVIEW
##### 50 points
Question
--
`interview.polictf.it:80`
Readings
--
* https://www.youtube.com/watch?v=zfy5dFhw3ik

Answer
--
We first use `nc` to connect the server and the result is:  
```bash
$ nc interview.polictf.it 80
         ____                                     __                              __
        /\  _`\                                  /\ \__                          /\ \__
        \ \ \/\ \     __   _____      __     _ __\ \ ,_\   ___ ___      __    ___\ \ ,_\  
         \ \ \ \ \  /'__`\/\ '__`\  /'__`\  /\`'__\ \ \/ /' __` __`\  /'__`\/' _ `\ \ \/  
          \ \ \_\ \/\  __/\ \ \L\ \/\ \L\.\_\ \ \/ \ \ \_/\ \/\ \/\ \/\  __//\ \/\ \ \ \_
           \ \____/\ \____\\ \ ,__/\ \__/.\_\\ \_\  \ \__\ \_\ \_\ \_\ \____\ \_\ \_\ \__\
            \/___/  \/____/ \ \ \/  \/__/\/_/ \/_/   \/__/\/_/\/_/\/_/\/____/\/_/\/_/\/__/
                             \ \_\
                              \/_/
                     ___      ____               ___
                   /'___\    /\  _`\           /'___\
              ___ /\ \__/    \ \ \/\ \     __ /\ \__/   __    ___     ____     __
             / __`\ \ ,__\    \ \ \ \ \  /'__`\ \ ,__\/'__`\/' _ `\  /',__\  /'__`\
            /\ \L\ \ \ \_/     \ \ \_\ \/\  __/\ \ \_/\  __//\ \/\ \/\__, `\/\  __/
            \ \____/\ \_\       \ \____/\ \____\\ \_\\ \____\ \_\ \_\/\____/\ \____\
             \/___/  \/_/        \/___/  \/____/ \/_/ \/____/\/_/\/_/\/___/  \/____/


____ ____ ____ ___ ____ _ ____ ___ ____ ___     ____ ____ ____ ____ ____ ____    ____ _  _ _    _   _
|__/ |___ [__   |  |__/ | |     |  |___ |  \    |__| |    |    |___ [__  [__     |  | |\ | |     \_/  
|  \ |___ ___]  |  |  \ | |___  |  |___ |__/    |  | |___ |___ |___ ___] ___]    |__| | \| |___   |


fish@sword:~$ help
 A very hard interview: Codename Blow...Fish
Maybe you can help me with something...
DOD d-base, 128 bit encryption....What do you think?
Maybe slide in a Trojan horse hiding a worm...
I have been told that best "crackers" in the world can do it 60 minutes, unfortunately i need someone who can do it in 60 seconds... naturally with the right incentives ;)
If you know what I mean, tell me how a real cracker accesses to a remote super protected server...

Possible commands:
	  hacker: Write code as a real hacker
	    help: Give informations about the program
	    hint: Gives a little hint
	    exit: Loser...bye Bye
	     ssh: A tiny ssh command
	    date: A very useful and innovative feature
```
Now we must remember [sward fish movie](https://www.youtube.com/watch?v=zfy5dFhw3ik) famous scene; The usernames and IPs was these:  

Usernames:  
* admin
* bin
* ...  

IPs:
* 213.225.312.5
* 312.5.125.233  

After try some we have:  
```
fish@sword:~$ ssh admin@312.5.125.233
 flag{H4ll3_B3rry's_t0pl3ss_sc3n3_w4s_4ls0_n0t4bl3}
```  
#####Flag: `flag{H4ll3_B3rry's_t0pl3ss_sc3n3_w4s_4ls0_n0t4bl3}`
