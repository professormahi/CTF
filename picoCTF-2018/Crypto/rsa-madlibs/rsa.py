from pwn import *

sh = remote('2018shell2.picoctf.com', 40440)

# https://stackoverflow.com/questions/4798654/modular-multiplicative-inverse-function-in-python
def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m

# question 1
q1 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')
q = int(q1[-5].split(' : ')[1])
p = int(q1[-4].split(' : ')[1])

sh.sendline('y')
sh.sendlineafter('n: ', str(p*q))

print 'question 1 done'

# question 2
q2 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')
p = int(q2[-5].split(' : ')[1])
n = int(q2[-4].split(' : ')[1])

sh.sendline('y')
sh.sendlineafter('q: ', str(n/p))

print 'question 2 done'

# question 3
q3 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')

sh.sendline('n')

print 'question 3 done'

# question 4
q4 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')

q = int(q4[-5].split(' : ')[1])
p = int(q4[-4].split(' : ')[1])

sh.sendline('y')
sh.sendlineafter('totient(n): ', str((p-1)*(q-1)))

print 'question 4 done'

# question 5
q5 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')

plaintext = int(q5[-6].split(' : ')[1])
e = int(q5[-5].split(' : ')[1])
n = int(q5[-4].split(' : ')[1])

sh.sendline('y')
sh.sendlineafter('ciphertext: ', str(pow(plaintext, e, n)))

print 'question 5 done'

# question 6
q6 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):')

sh.sendline('n')

print 'question 6 done'

# question 7
q7 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')

q = int(q7[-6].split(' : ')[1])
p = int(q7[-5].split(' : ')[1])
e = int(q7[-4].split(' : ')[1])

sh.sendline('y')
sh.sendlineafter('d: ', str(modinv(e, (p-1)*(q-1))))

print str(modinv(e, (p-1)*(q-1)))

print 'question 7 done'

# question 8
q8 = sh.recvuntil('IS THIS POSSIBLE and FEASIBLE? (Y/N):').split('\n')

p = int(q8[-7].split(' : ')[1])
ciphertext = int(q8[-6].split(' : ')[1])
e = int(q8[-5].split(' : ')[1])
n = int(q8[-4].split(' : ')[1])

q = n/p
d = modinv(e, (p-1)*(q-1))
m = pow(ciphertext, d, n)

sh.sendline('y')
sh.sendlineafter('plaintext: ', str(m))

print 'question 8 done'

flag = unhex(hex(m)[2:])

print 'flag: {}'.format(flag)

sh.interactive()
