*** Settings ***
Library           Process
Resource          ../Keywords/connect_to_harbor.txt

*** Variables ***
${harbor_registry}    http://<harbor-registry-url>
${image_name}     <image-name>
${tag}            <tag>
${container_name}    <container-name>

*** Test Cases ***
Download_image_from_harbor
    Open Session
    Connect_to_harbor    ${harbor_registry}    ${harbor_username}    ${harbor_password}
    Pull Image from Harbor    ${harbor_registry}    image_name    tag_name
    Verify Image Download    ${image_name}
    deploy_image    container_name    ${harbor_registry}    image_name    tag_name

Deploy_image
    Comment    Open Session
    Comment    Connect_to_harbor    ${harbor_registry}    ${harbor_username}    ${harbor_password}
    Comment    pull_image_with_CSV_file    ${EXECDIR}/DataInputs/image_list.csv
    ${result}=    Set Variable    345.5
    Append To File    ${EXECDIR}/DataInputs/result.txt    ${result}
