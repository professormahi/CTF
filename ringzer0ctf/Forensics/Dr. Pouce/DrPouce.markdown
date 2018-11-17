##### [Dr. Pouce](http://ringzer0team.com/challenges/103)
##### Answer
They have abductioned Dr. Pouce, you must find him the kidnapper ;)

Every file has some metadatas that specifies the owner file and so on so if you write a file your datas will be stored

First we must unzip the file:
```
  $ uz 0aa199aedbc8aff5296a078221190287.zip

  Extracting from  "0aa199aedbc8aff5296a078221190287.zip".
  Archive:  0aa199aedbc8aff5296a078221190287.zip
    inflating: DR_Pouce.pdf            
    inflating: DR_Pouce.jpg
```
Now we have 2 files a pdf and an image. No we use [an exif finder](http://regex.info/exif.cgi) to find where the picture has been token and the result is `5184 Sackville Street, Halifax, NS B3J, Canada`, Then we must find the author of pdf file, we simply do that by right clicking on it and see options :D. The result is `Steve Finger`.

Now according to question the flag is `halifaxstevefinger`.  
Be happy ;)
