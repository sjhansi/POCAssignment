import json
import boto3
import os

client = boto3.client('sns')

def lambda_handler(event, context):
    Body = json.dumps(event)
    print(Body)
    response = client.publish(TopicArn=os.environ['sns_topic_arn'], Message=Body)

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['dynamodb_table_name'])
    table.put_item(
        Item = event
    )
    print('Add SG event details to DynamoDB Table Item!')

    return {
        'statusCode' : 200,
        'body' : json.dumps('Hello from Lambda!')
    }
    