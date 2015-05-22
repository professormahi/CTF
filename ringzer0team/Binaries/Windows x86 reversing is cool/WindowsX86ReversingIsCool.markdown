#####[Windows x86 reversing is cool](http://ringzer0team.com/challenges/28)
#####Answer

After opening the `.exe` file using [IDA](https://www.hex-rays.com/products/ida/), in the graph view we can understand that the length of key is `6`:  
![len](len.png)  
The at the next stage each character will be XORed with `D3`:  
![xor](xor.png)  
So easily it's enough to XOR `ùadá+ß` with D3 in each character. Hex of `ùadá+ß` can be find in hex dump:  
![hex](hex.png)  
So the result is easy:  


| | #1 | #2 | #3 | #4 | #5 | #6 |
| :-: | :-: | :-: | :-: | :-: | :-: |
| | 97 | E0 | EB | A0 | B8 | E1 |
| XOR | D3 | D3 | D3 | D3 | D3 | D3 |
| res<sub>char</sub> | 44<sub>D</sub> | 33<sub>3</sub> | 38<sub>8</sub> | 73<sub>s</sub> | 6B<sub>k</sub> | 32<sub>2</sub> |


Now we enter `D38sk2` as key and will receive the flag:  
```
FLAG-PIIXtM36MtKJ8347qh72r7C3
```

This is the way hacker works :D
