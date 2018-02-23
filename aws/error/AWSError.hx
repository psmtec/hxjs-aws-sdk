package aws.error;

typedef AWSError = {
    code: String,
    message: String,
    retryable: Bool,
    statusCode: Int,
    time: Date,
    hostname: String,
    region: String,
    retryDelay: Float, // Int?
    requestId: String,
    extendedRequstId: String,
    cfId: String,
}
