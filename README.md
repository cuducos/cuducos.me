# Eduardo Cuducos [![Netlify Status](https://api.netlify.com/api/v1/badges/34646b4a-cbca-4f0d-8db9-b7ecfb359e91/deploy-status)](https://app.netlify.com/sites/cuducos/deploys)

[Jekyll](https://jekyllrb.com) source files for [my personal page & blog](https://cuducos.me).

## Getting started

Build the Docker image:

```console
$ docker build -t cuducos.me .
```

Change the site URL at `_config.yml` if needed.

## Previewing

To launch the server at [`localhost:4000`](http://localhost:4000):

```console
$ docker run -p 4000:4000 -v $(pwd)/_site/:/home/cuducos/_site/ cuducos.me s
```

## Building

And finally build the site into `_site/`:

```console
$ docker run -v $(pwd)/_site/:/home/cuducos/_site/ cuducos.me b
```

Optionally use set `ENV` variable to build the site with the _production_ server settings:

```console
$ docker run -e "JEKYLL_ENV=production" -v $(pwd)/_site/:/home/cuducos/_site/ cuducos.me b
```

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
