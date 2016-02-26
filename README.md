# Eduardo Cuducos

[Jekyll](http://jekyllrb.com) source files for [my personal website](http://cuducos.me).

## Build instructions

First install the required [Ruby](http://ruby-lang.org) gems:

```console
$ gem install bundler
$ bundle install
```

Then move [Bourbon](http://bourbon.io), [Neat](http://neat.bourbon.io) & [Bitter](http://bitters.bourbon.io/) to the `css` folder, and [Font Awesome](http://fortawesome.github.io/Font-Awesome/) to the `fonts` folder:

```console
$ bourbon install && mv bourbon/ _sass/bourbon/
$ neat install && mv neat/ _sass/neat/
$ bitters install && mv base/ _sass/base/
$ sh contrib/install-font-awesome.sh
```

Change the site URL at `_config.yml` if needed.

And finally build the site:

```console
$ jekyll b
```

Optionally use set `ENV` variable to build the site with the _production_ server settings:

```console
$ JEKYLL_ENV=production jekyll b
```

To view the site after building it just open `_site/index.html` with your favorite browser.

```console
$ open _site/index.html
```