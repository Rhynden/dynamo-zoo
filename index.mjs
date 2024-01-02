import { DynamoDB } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocument } from '@aws-sdk/lib-dynamodb';
import { S3Client, GetObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";


const client = new S3Client();
const dynamo = DynamoDBDocument.from(new DynamoDB());

console.log('Loading function');

export const handler = async (event, context) => {
    //console.log('Received event:', JSON.stringify(event, null, 2));

    let body;
    let statusCode = '200';
    const headers = {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Headers" : "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "*"
    };

    try {
        switch (event.httpMethod) {
            // case 'DELETE':
            //     body = await dynamo.delete(JSON.parse(event.body));
            //     break;
            case 'GET':
                const queryParams = {
                    KeyConditionExpression : "animal_name = :dog",
                    ExpressionAttributeValues: {
                        ':dog': "dog"
                    },
                    TableName: "animals",
                    ProjectionExpression: 's3_object_key'
                }
                const { Items } = await dynamo.query(queryParams);

                const randomIndex  = Math.floor(Math.random() * Items.length);

                const randomItem = Items[randomIndex];

                const command = new GetObjectCommand({Bucket: "fb-dynamozoo-image-bucket" , Key: randomItem.s3_object_key });

                // Expire after 1 minute
                const url = await getSignedUrl(client, command, { expiresIn: 60 });

                body = { s3_object_url: url };

                break;
            // case 'POST':
            //     body = await dynamo.put(JSON.parse(event.body));
            //     break;
            // case 'PUT':
            //     body = await dynamo.update(JSON.parse(event.body));
            //     break;
            default:
                throw new Error(`Unsupported method "${event.httpMethod}"`);
        }
    } catch (err) {
        statusCode = '400';
        body = err.message;
    } finally {
        body = JSON.stringify(body);
    }

    return {
        statusCode,
        body,
        headers,
    };
};
