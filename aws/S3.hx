package aws;

typedef AWSError = aws.error.AWSError;

typedef Body = Dynamic; // export type Body = Buffer|Uint8Array|Blob|string|Readable;
typedef BucketName = String;
typedef GrantRead = String;
typedef ObjectKey = String;
typedef ETag = String;

typedef IfMatch = String;

@:enum abstract ObjectCannedACL(String) to String {
	var Private = 'private';
	var PublicRead = 'public-read';
	var PublicReadWrite = 'public-read-write';
	var AuthenticatedRead = 'authenticated-read';
	var AwsExecRead = 'aws-exec-read';
	var BucketOwnerRead = 'bucket-owner-read';
	var BucketOwnerFullControl = 'bucket-owner-full-control';
}

// typedef CreateBucketRequest = {}
// typedef CreateBucketOutput = {}

typedef PutObjectRequest = {
	Bucket: BucketName,
	Key: ObjectKey,

	?ACL: ObjectCannedACL,
	?Body: Body,
	// ... TODO (DK) remaining fields
}

typedef PutObjectOutput = {}

typedef GetObjectRequest = {
    Bucket: BucketName,
	Key: ObjectKey,

	?IfMatch: IfMatch,

	// ... TODO (DK) remaining fields
}

typedef GetObjectOutput = {
	ETag: ETag,
	// ... TODO (DK) remaining fields
}

typedef Request<A, B> = {}

@:jsRequire('aws-sdk', 'S3')
extern class S3 {
	public function new() : Void;

	public function putObject( params: /*S3.Types.*/PutObjectRequest, ?callback: (err: AWSError, data: /*S3.Types.*/PutObjectOutput) -> Void ) : Request</*S3.Types.*/PutObjectOutput, AWSError>;
	public function getObject( params: /*S3.Types.*/GetObjectRequest, ?callback: (err: AWSError, data: /*S3.Types.*/GetObjectOutput) -> Void ) : Request</*S3.Types.*/GetObjectOutput, AWSError>;

	// public function createBucket( params: /*S3.Types.*/CreateBucketRequest, ?callback: (err: AWSError, data: /*S3.Types.*/CreateBucketOutput) -> Void ) : Request</*S3.Types.*/CreateBucketOutput, AWSError>; // Void;
}
