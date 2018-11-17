##### [Password reset](http://ringzer0team.com/challenges/113)
##### Answer

As you see we must reset password for `admin` after requesting for reset you'll see the message bellow:
```
Reset password link has been sent to admin@youdontownthisemail.com.
Please follow the link http://ringzer0team.com/challenges/113/?k=[your 16 digits code] soon as possible your token expired in 1 hour.
```

Now we will see the [source code](http://ringzer0team.com/files/51e157a76ec4a537756e904d586fef41) in the source `srand` shines :D. Because we know if we have the seed of `srand` we can guess the random and because we can see the time of the system `Sun, 26 Apr 2015 06:45:39 -0400` so we must:
1. Convert time to `Unix time` using any tool. Online or offline. For example I've used [unixtimestamp.com](http://www.unixtimestamp.com/index.php) to do that. The result is `1430045139`.
2. Now we must write a php code to make `k` for us
```
srand(1430045139);
$token =rand(1000000000000000,9999999999999999);
echo $token;
```
And the result is `9260516868904234`.
3. So, we can generate the reset url and give the password. The password is `Thi%P@s50rD!sM1n3*`
4. We must login and submit the flag. The flag is `FLAG-DlwwTV7vCQf4Dn281Yhb802x5U`

Keep calm and think about more flags :D
