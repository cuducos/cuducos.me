if [ -n "$CUDUCOSME" ]; then

    echo '\n==> Cleaning system created files'
    find . -iname '.DS_Store' -exec rm {} \;

    echo '\n==> Cleaning _site/'
    bundle exec jekyll clean

    echo '\n==> Instaling NodeJS and Bower dependencies'
    npm install

    echo '\n==> Generating JavaScript'
    npm run js

    echo '\n==> Copying Font-Awesome files to assets/'
    npm run fonts

    echo '\n==> Generating the site at _site/'
    JEKYLL_ENV=production bundle exec jekyll build

    echo '\n==> Syncing with the remote sever'
    rsync -crvz --delete _site/ $CUDUCOSME

else

    echo '\nPlease, set the environment variable `CUDUCOSME` with the server SSH info.'
    echo '(e.g. `export CUDUCOSME=user:secret@server.org:/users/user/www/`)\n'

fi
