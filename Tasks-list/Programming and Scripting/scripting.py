import os
import boto3
import requests

os.environ['AWS_DEFAULT_REGION'] = 'us-west-2'
os.environ['AWS_PROFILE'] = 'default'
ssm_client = boto3.client('ssm')
api_token = os.environ.get('api_token_key')


response = requests.get("https://api.themoviedb.org/3/authentication/token/new?api_key=${api_token}")


new_string_parameter = ssm_client.put_parameter(
    Name='API Token',
    Value=response.json().get("request_token"),
    Type='SecureString',
    Overwrite=True,
    Tier='Standard')
    

{u'Tier': u'Standard', u'Version': 1, 'ResponseMetadata': {'RetryAttempts': 0, 'HTTPStatusCode': 200, 'RequestId': 'c15b124f-65ff-4fdd-9fdb-04d31485b3e1', 'HTTPHeaders': {'x-amzn-requestid': 'c15b124f-65ff-4fdd-9fdb-04d31485b3e1', 'content-length': '31', 'server': 'Server', 'connection': 'keep-alive', 'date': 'Tue, 02 Aug 2022 09:04:30 GMT', 'content-type': 'application/x-amz-json-1.1'}}}

print(
    f"String Parameter created with version {new_string_parameter['Version']} and Tier {new_string_parameter['Tier']}"
)
