
echo '\n==> Generating the site at _site/'
JEKYLL_ENV=production bundle exec jekyll build

echo '\n==> Syncing with the remote sever'
rsync -crvz --delete _site/ $CUDUCOSME
