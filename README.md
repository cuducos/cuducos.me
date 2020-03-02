# Eduardo Cuducos

[Jekyll](https://jekyllrb.com) source files for [my personal page & blog](https://cuducos.me).

Requires [Ruby](http://ruby-lang.org) (version specified in `Gemfile`) with [Bundler](http://bundler.io).

## Getting started

Install  the dependacies:

```console
$ bundle install
```

Then install the SASS libraries inside `_sass` directory:

```console
$ cd _sass
$ bundle exec bourbon install
$ bundle exec neat install
$ bundle exec bitters install
```

Finally, change the site URL at `_config.yml` if needed.

## Building

And finally build the site into `_site/`:

```console
$ jekyll b
```

Optionally use set `ENV` variable to build the site with the _production_ server settings:

```console
$ JEKYLL_ENV=production jekyll b
```

### Deploy

To deploy using `awscli`, set it's credentials and run:

```console
$ ./contrib/deploy.sh
```

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
