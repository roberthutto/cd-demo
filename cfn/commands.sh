#!/usr/bin/env bash

#upload and set permissions for cloudformation template files
aws --profile rob s3 cp /Users/robert/IdeaProjects/demo/cfn/teamcity-instance.template s3://demo-cfn-public/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
aws --profile rob s3 cp /Users/robert/IdeaProjects/demo/cfn/demo-master.template s3://demo-cfn-public/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers


# run master stack
aws --profile rob cloudformation create-stack \
    --template-body https://s3.amazonaws.com/demo-cfn-public/demo-master.template \
    --region us-east-1 --disable-rollback --capabilities="CAPABILITY_IAM" \
    --parameters ParameterKey=KeyName,ParameterValue=rob-east \
    --stack-name demo7