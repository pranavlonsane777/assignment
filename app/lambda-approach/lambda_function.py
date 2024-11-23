import boto3
import json
import os

def lambda_handler(event, context):
    # Fetch the bucket name from the environment variable
    bucket_name = os.getenv("AWS_BUCKET_NAME")
    if not bucket_name:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": "AWS_BUCKET_NAME environment variable is not set."})
        }
    
    # Extract the path parameter or set it to an empty string (root level)
    path = event.get("pathParameters", {}).get("path", "")
    s3 = boto3.client('s3')

    try:
        # List objects in the S3 bucket with the specified prefix
        response = s3.list_objects_v2(Bucket=bucket_name, Prefix=path, Delimiter='/')
        
        # Handle case: No content or invalid path
        if 'Contents' not in response and 'CommonPrefixes' not in response:
            return {
                "statusCode": 404,
                "body": json.dumps({"error": f"Path '{path}' does not exist or is empty."})
            }
        
        # Extract directories and files
        directories = [p.get('Prefix').rstrip('/') for p in response.get('CommonPrefixes', [])]
        files = [o.get('Key').split('/')[-1] for o in response.get('Contents', []) if o.get('Key') != path]

        return {
            "statusCode": 200,
            "body": json.dumps({"content": directories + files})
        }

    except boto3.exceptions.Boto3Error as e:
        # Return an error if the S3 operation fails
        return {
            "statusCode": 500,
            "body": json.dumps({"error": f"S3 Error: {str(e)}"})
        }
    except Exception as e:
        # Handle unexpected errors
        return {
            "statusCode": 500,
            "body": json.dumps({"error": f"Unexpected Error: {str(e)}"})
        }
