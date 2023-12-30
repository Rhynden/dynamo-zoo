console.log('Loading function');

export const handler = async (event, context) => {
    const response = {
        statusCode: '200',
        headers: {
            "Access-Control-Allow-Headers" : "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "*"
        },
        body: 'Hello world from my lambda',
    };

    return response;
};