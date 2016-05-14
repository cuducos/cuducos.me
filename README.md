# Eduardo Cuducos

[Jekyll](http://jekyllrb.com) source files for [my personal blog](http://cuducos.me).

## Build instructions


### Requirements & dependencies

First install the required [Ruby](http://ruby-lang.org) gems:

```console
$ gem install bundler
$ bundle install
```

### Settings

Change the site URL at `_config.yml` if needed.

Then prepare [Bourbon](http://bourbon.io), [Neat](http://neat.bourbon.io) & [Bitter](http://bitters.bourbon.io/) and [Font Awesome](http://fortawesome.github.io/Font-Awesome/) to be found by Jekyll SASS processor and to be accessible in the `assets` directory:

```console
$ ./contrib/assets.sh
```

### Building

And finally build the site:

```console
$ jekyll b
```

Optionally use set `ENV` variable to build the site with the _production_ server settings:

```console
$ JEKYLL_ENV=production jekyll b
```

### Accessing

To view the site after building it just open `_site/index.html` with your favorite browser.

```console
$ open _site/index.html
```
## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)