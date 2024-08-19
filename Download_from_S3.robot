*** Settings ***
Library           Collections
Library           AWSLibrary
Resource          ../Keywords/connect_to_S3.txt

*** Test Cases ***
File download from S3
    Create S3 Object    ${bucket_name}    ${object_key}    ${file_path}
    Upload File to S3 Bucket    ${file_path}
    File Should Exist In S3 Bucket    ${file_path}
    Download Object From S3 Bucket    ${bucket_name}    ${object_key}    ${file_path}

Upload File
    Create Session With Keys    ${aws_region}    ${aws_access_key}    ${aws_secret_key}
    Upload File    ${bucket_name}    ${KEY}    ${PATH}
    Key Should Exist    ${bucket_name}    ${KEY}
    Delete File    ${bucket_name}    ${KEY}
    Delete All Sessions

Upload file to S3 folder
    ${uploadKey}=    Set Variable    ${s3FolderName}/upload.csv
    ${uploadPath}=    Set Variable    ${PATH}/upload.csv
    Create Session With Keys    ${aws_region}    ${aws_access_key}    ${aws_secret_key}
    Upload File    ${bucket_name}    ${uploadKey}    ${uploadPath}
