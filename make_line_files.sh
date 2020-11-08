#!/bin/bash

if [ ${#} -ne 1 ]; then
    echo "Expected 1 command-line arguemnt but recieved ${#} instead" >&2
    exit 1
fi

if [ -e "test_suite.txt" ]; then
    rm test_suite.txt
fi
touch test_suite.txt

test_num=1
# iterate over every line from the input file
while read line; do
    echo "${line}" > "test_${test_num}.args"   #can change "args" to any other required suffix such as "in" 

    #add test stem to test_suite.txt
    echo "test_${test_num}" >> test_suite.txt  
    # note the ">>" means that instead of overwritting the contents in test_suite.txt, 
    #  it instead appends the info onto a new line in test_suite.txt after the existing content in it

    test_num=$((test_num + 1))
done < $1
