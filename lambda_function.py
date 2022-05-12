import json


def lambda_handler(event, context):
    # TO DO
    output = event

    # Return    
    return {
        'statusCode': 200,
        'headers':{
            'Conetent-Type':'application/json',
            'Access-Control-Allow-Origin':'*'
        },
        'body': json.dumps(output)
    }

if __name__ == "__main__":
    args = {
        "key" : "value"
    }
    print(lambda_handler(args,None))

