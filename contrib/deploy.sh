if [ -n "$CUDUCOSME" ]; then

    echo '\n==> Cleaning system created files'
    find . -iname '.DS_Store' -delete

    echo '\n==> Cleaning _site/'
    bundle exec jekyll clean

    echo '\n==> Instaling NodeJS packages'
    npm install

    echo '\n==> Generating assets'
    npm run assets

    echo '\n==> Generating the site at _site/'
    JEKYLL_ENV=production bundle exec jekyll build

    echo '\n==> Syncing with the remote sever'
    rsync -crvz --delete _site/ $CUDUCOSME

else

    echo '\nPlease, set the environment variable `CUDUCOSME` with the server SSH info.'
    echo '(e.g. `export CUDUCOSME=user:secret@server.org:/users/user/www/`)\n'

fi
