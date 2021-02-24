echo "AWS Account: $1"
echo "AWS Profile: $2"
#echo "sed -i \"s/\${AWS::AccountId}:role/$1:role/g\" packaged.yml"
#sed -i "s/\${AWS::AccountId}:role/$1:role/g" packaged.yml

echo "cloudformation deploy --template-file packaged.yml --stack-name standard-rss-feed-simulator-api-stack --region sa-east-1 --profile $2"
aws cloudformation deploy --template-file packaged.yml --stack-name standard-rss-feed-simulator-api-stack --region sa-east-1 --profile $2