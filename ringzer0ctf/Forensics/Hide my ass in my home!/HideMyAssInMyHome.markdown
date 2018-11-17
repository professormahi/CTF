##### [Hide my ass in my home](http://ringzer0team.com/challenges/65)
##### Answer
The downloaded file is a `.tar.gz` file so for extarcting we must use `tar` command:
```
  $ tar xvfz 3d1e957be3b4880a4481d193eb563aff.tar.gz .
  ./
  ./.viminfo
  ./.bash_profile
  ./bob.tar.gz
  ./.bashrc
  ./.bash_logout
  ./.mozilla/
  ./.mozilla/extensions/
  ./.mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/
  ./.mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/.fedora-langpack-install
  ./.mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/langpack-fr@firefox.mozilla.org.xpi
  ./.mozilla/plugins/
  ./index.html
  ./.bash_history
  ./1601066_559677267463652_942103441_n.jpg
  ./Electro - Swing || Jamie Berry Ft. Octavia Rose - Delight.mp3
  ./.gnome2/
  ./you
  ./.me.swp
```
It seems this files are his home, and we must find flag in them. We try files, pictures and so on. Finally we found flag in `.me.swp` file.
```
  $ cat .me.swp
  b0VIM 7.2|�S
  U3210#"! Utpad���Flag-1s4g76jk89ffull of full and sunfull and i'm beau
```
So the flag is `Flag-1s4g76jk89f`

Happy capturing flag ;)
