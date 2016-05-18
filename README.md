# Eduardo Cuducos

[Jekyll](http://jekyllrb.com) source files for [my personal page & blog](http://cuducos.me).

## Build instructions

Basic requirements:

* [Ruby](http://ruby-lang.org) 2.3.1 with `gem`
* [NodeJS](http://nodejs.org) with `npm`

### Dependencies

Install [Bundler](http://bundler.io) gem, then the other   required [Ruby](http://ruby-lang.org) gems:

```console
$ gem install bundler
$ bundle install
```
To build the front-end some NodeJS and [Bower](http://bower.io) packages are required:

```console
# npm install
```
Then prepare the front-end assets:

```console
$ npm run js
$ npm run fonts
```

### Settings

Change the site URL at `_config.yml` if needed.

### Building

And finally build the site into `_site/`:

```console
$ jekyll b
```

Optionally use set `ENV` variable to build the site with the _production_ server settings:

```console
$ JEKYLL_ENV=production jekyll b
```

### Deploy

To deploy via `rsync`, set the environment variable `CUDUCOSME` with the SSH path to the server and directory where you want to deploy (e.g.: `user:secret@server.org:/users/user/www/`). Then run:

```console
$ ./contrib/deploy.sh
```

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)