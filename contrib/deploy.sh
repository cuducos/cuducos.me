echo '\n==> Cleaning system created files'
find . -iname '.DS_Store' -delete

echo '\n==> Generating the site at _site/'
JEKYLL_ENV=production bundle exec jekyll build

echo '\n==> Syncing with the remote sever'
aws s3 sync _site s3://cuducos.me --delete
