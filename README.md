# CS-246-Files
Bash scripts used in CS 246 for creating test suites to practice Test Driven Development.


## Information for make_line_files.sh :

Tired of manually making numerous .args files?
I created a bash script that might make the process of creating .[in|args] files for test suites easier

 
**WHAT DOES THIS SCRIPT DO?**

Basically, it takes in a file with N lines and then creates N new .args files where each .args file contains 1 single line from the input file. (note: each .args file has a unique stem_name in the format: test_{#} ) Additionally, it also creates a file called test_suite.txt which contains the stem_name for each of the .args files.


**EXAMPLE OF USE:**

Say, for A2DD1 we were testing the lineWrap program with these example command uses from the A2:

> lineWrap -n 15 -c gong test1.txt

> lineWrap -c gong test1.txt -n 15

> lineWrap test1.txt -n 15 -c gong

Then, instead of creating 3 separate .args files, we can make ONE single file, which we will call all_test_args.txt . Next, we include all 3 arguments on 3 separate lines in all_test_args.txt as follows:
```
-n 15 -c gong test1.txt
-c gong test1.txt -n 15
test1.txt -n 15 -c gong
``` 

Now, if we run the command, ```./make_line_files.sh all_test_args.txt``` , the program make_line_files.sh will create the following 4 files: test_1.args, test_2.args, test_3.args, and test_suite.txt.

The contents of test_1.args will be:
```
-n 15 -c gong test1.txt
```
The contents of test_2.args will be:
```
-c gong test1.txt -n 15
```
The contents of test_3.args will be:
```
test1.txt -n 15 -c gong
```
The contents of test_suite.txt will be:
```
test_1
test_2
test_3
```

**ADDITIONAL INFO:**


Note: say after creating the 3 .args files and test_suite.txt, I realize I forgot to test the case, -n 10 -c gong test1.txt. I can go back into, all_test_args.txt and add the new argument on a new line so that all_test_args.txt now looks like this:
```
-n 15 -c gong test1.txt
-c gong test1.txt -n 15
test1.txt -n 15 -c gong
-n 10 -c gong test1.txt
```
Then, all I have to do is rerun the following command:  ```./make_line_files.sh all_test_args.txt``` . This will create a new file, test_4.args, and also update test_suite.txt to include "test_4" on line 4. (Also, note that even though the contents of test_1.args, test_2.args, and test_3.args will be overwritten, they will still be the same because we only changed line 4 in all_test_args.txt)

ie. The contents of test_1.args will remain the same:
```
-n 15 -c gong test1.txt
```
ie. The contents of test_2.args will remain the same:
```
-c gong test1.txt -n 15
```
ie. The contents of test_3.args will remain the same:
```
test1.txt -n 15 -c gong
```
ie. A new file test_4.args will be created with the contents:
```
-n 10 -c gong test1.txt
```
ie. Now, the contents of test_suite.txt will automatically be updated to:
```
test_1
test_2
test_3
test_4
 ```
I hope this was useful as we will have to make test suite for all assignments in this course.
