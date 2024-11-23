from flask import Flask, jsonify, abort
import boto3
import os

app = Flask(__name__)

# AWS S3 Configuration
BUCKET_NAME = os.getenv('BUCKET_NAME', 'default-bucket-name')
s3_client = boto3.client('s3')

@app.route('/list-bucket-content', defaults={'path': ''}, methods=['GET'])
@app.route('/list-bucket-content/<path:path>', methods=['GET'])
def list_bucket_content(path):
    try:
        prefix = f"{path}/" if path else ''
        response = s3_client.list_objects_v2(Bucket=BUCKET_NAME, Prefix=prefix, Delimiter='/')

        content = []
        if 'CommonPrefixes' in response:
            content.extend([item['Prefix'].rstrip('/').split('/')[-1] for item in response['CommonPrefixes']])
        if 'Contents' in response:
            content.extend([item['Key'].split('/')[-1] for item in response['Contents'] if item['Key'] != prefix])

        return jsonify({"content": content})
    except s3_client.exceptions.NoSuchBucket:
        abort(404, description="Bucket not found")
    except Exception as e:
        abort(500, description=str(e))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
