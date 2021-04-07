require 'refile/s3'

if Rails.env.production?
  aws = {
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: 'ap-northeast-1',
    bucket: 'my-portfolio-lifehacknote',
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end