# goofys

[Goofys](https://github.com/kahing/goofys) S3 Filesystem Docker Implementation.


## Examples

```sh
export AWS_ACCESS_KEY_ID=`grep aws_access_key_id ~/.aws/credentials | awk '{print $3}'`
export AWS_SECRET_ACCESS_KEY=`grep aws_secret_access_key ~/.aws/credentials | awk '{print $3}'`

docker run -it --rm --privileged -e BUCKET="bucket" -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY ghcr.io/mbakirov/goofys:latest
```

By default S3 bucket will be mounted under `/mnt/s3`, but you could customize the mount point by setting `MOUNT_DIR` environment variable.

Available environment variables:
- `BUCKET` - S3 bucket name
- `MOUNT_DIR` - Mount point (default: `/mnt/s3`)
- `MOUNT_ACCESS` - Mount access (default: `nonempty`)
- `AWS_ACCESS_KEY_ID` - AWS Access Key
- `AWS_SECRET_ACCESS_KEY` - AWS Secret Access Key
- `REGION` - AWS Region (default: `us-east-1`)
- `ENDPOINT` - S3 Endpoint (default: `https://s3.amazonaws.com`)
- `ACL` - S3 Bucket ACL (default: `private`)
- `STAT_CACHE_TTL` - Cache TTL for stat entries (default: empty)
- `TYPE_CACHE_TTL` - Cache TTL for type entries (default: empty)
- `DIR_MODE` - Directory mode (default: `0700`)
- `FILE_MODE` - File mode (default: `0600`)
- `UID` - User ID (default: `0`)
- `GID` - Group ID (default: `0`)

## Contributing
In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!