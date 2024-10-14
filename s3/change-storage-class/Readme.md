## Create our bucket

'''sh
aws s3 mb s3://class-fun-mo-523521
'''

## Create a new file

echo "Hello world" > hello.txt
aws s3 cp hello.txt s3://class-fun-mo-523521 --storage-class STANDARD_IA

## CLearn up

aws s3 rm s3://class-fun-mo-523521/hello.txt
aws s3 rb s3://class-fun-mo-523521
