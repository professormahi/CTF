#### pwnable-kr
##### Toddler's Bottle | fd challenges
**Note** 
> fd in unix systems has 3 default value:
> fd=0 --> standard input
> fd=1 --> standard output
> fd=2 --> standard error

to solve this challenge just make `fd = 0`, for this use `0x1234` in decimal in the entry point and after that enter `LETMEWIN\n` :)
