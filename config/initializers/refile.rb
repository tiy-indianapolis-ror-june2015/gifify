require "refile/s3"

aws = {
  access_key_id: ENV["amazon_access_key"],
  secret_access_key: ENV["amazon_secret_key"],
  region: ENV["amazon_region"],
  bucket: ENV["amazon_bucket"]
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
