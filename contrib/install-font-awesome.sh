#!/bin/sh
git clone git@github.com:FortAwesome/font-awesome-sass.git
cp -r font-awesome-sass/assets/fonts/font-awesome assets/fonts/font-awesome
rm -rf font-awesome-sass/
