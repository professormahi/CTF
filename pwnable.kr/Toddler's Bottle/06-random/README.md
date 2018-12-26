#### pwnable-kr
##### Toddler's Bottle | random challenges
**Note** 
`rand` function in this kind of use is not random. If you wanna have a random number you must use random seed; for this must read this code before using `rand` function.
```
srand(time(NULL)); // randomize seed
```
Because there is no random seed, the `rand` function give us a fixed number every time so you can edit c code to print the random number and compile the code with gcc to see the random number.</br>

Now you just need to XOR random number with `0xdeadbeef` to achieve the key.

##### read about random
* [random number aren't really random](https://www.nrjfl0w.org/index.php/2016/09/11/pwnable-kr-random-number-arent-really-random/)

