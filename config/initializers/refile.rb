# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     :provider               => 'AWS',
#     :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
#     :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
#     :region                 => ENV['AWS_S3_REGION']
#   }
#   config.fog_directory = ENV['AWS_S3_BUCKET']
# end

require "refile/backend/s3"

aws = {
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  bucket: ENV['AWS_S3_BUCKET'],
}
Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)