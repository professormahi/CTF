##### [Just another login form](http://ringzer0team.com/challenges/124)
##### Answer

There is a `LDAP` server that check queries and we can use `admin` and `*` as username and password. So the flag is:
```
Welcome to the LDAP World! FLAG-38i65201RR4B5g1oAm05fHO0QP
```

Just filter your web application inputs for `SQL Injection` and `LDAP Injection`
