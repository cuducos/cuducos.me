# clean current files
echo '\n==> Removing current files'
rm -rf _sass/bourbon/
rm -rf _sass/neat/
rm -rf _sass/base/
rm -rf assets/fonts/font-awesome/

# install bourbon, neat and bitters

echo '\n==> Installing Bourbon'
bourbon install --path _sass/

echo '\n==> Installing Neat'
neat install
echo 'Moving Neat from neat/ to _sass/neat/'
mv neat _sass/neat

echo '\n==> Installing Bitters'
bitters install --path _sass/

# install font-awesome
echo '\n==> Installing Font-Awesome'
git clone git@github.com:FortAwesome/font-awesome-sass.git
echo 'Copying Font-Awesome fonts to assets/fonts/'
cp -r font-awesome-sass/assets/fonts/font-awesome assets/fonts/font-awesome
echo 'Removing font-awesome-sass repository'
rm -rf font-awesome-sass/
