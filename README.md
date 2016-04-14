Sample project that starts an Elastic Beanstalk stack and an Associated TeamCity Instance.

1) Bootstraps the TeamCity Instance with the build configurations that are under version control
in the .teamcity/Demo of the project.

2) Deploys a SpringBoot application to the ElasticBeanStalk Stack

3) Code commits trigger an new build, add an application version with a label of the teamcity build number and deploys the app

4) Changes to build configurations via TeamCity UI or through code trigger a commit to version control and trigger a new build and deploy


Command to run:

    aws --profile <profile> cloudformation create-stack --stack-name demo \
    --template-body https://s3.amazonaws.com/demo-cfn-public/demo-master.template \
    --region us-east-1 \
    --disable-rollback \
    --capabilities="CAPABILITY_IAM"
    --parameters ParameterKey=KeyName,ParameterValue=<ssh key> \

Outputs

    AWSEBLoadBalancerURL - url of the loadbalanced ElasticBeanStalk Stack

    URL - the URL of the Team city instance. Credentials to login are admin:admin