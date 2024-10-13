## Create our bucket

'''sh
aws s3 mb s3://metadata-fun-mo-52352
'''

## Create a new file

echo "Hello Mars" > hello.txt

## Upload file with meta data

aws s3api put-object --bucket metadata-fun-mo-52352 --key hello.txt --body hello.txt --metadata Planet=Mars


## Get metadata through head object

aws s3api head-object --bucket metadata-fun-mo-52352 --key hello.txt
