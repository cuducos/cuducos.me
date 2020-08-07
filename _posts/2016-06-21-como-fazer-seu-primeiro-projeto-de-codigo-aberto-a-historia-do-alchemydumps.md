---
layout: post
title: "Como fazer seu primeiro projeto de código aberto: a história do AlchemyDumps"
---

Hoje eu estava pensando no [AlchemyDumps](https://github.com/cuducos/alchemydumps), um pacote [Python](https://python.org) que tem uma história legal. Resolvi contá-la aqui e — _spoiler_ — deixar um convite para quem está estudando Python.

* * *

Lá para meados de 2013, depois de escrever uma [dissertação sobre o caso do Aaron Swartz](http://cuducos.me/hacktivism/), enfiei na minha cabeça que eu iria aprender Python. Foi um das decisões mais acertadas da minha vida: foi quando comecei a me reconciliar com o mundo da programação, mundo que eu havia abandonado há uns 7 ou 8 anos.

Comecei fazendo um [curso no Coursera](https://www.coursera.org/course/interactivepython), depois fui lendo um [livro sobre Python](http://www.greenteapress.com/thinkpython/thinkpython.html). Fui [me atualizar](https://redd.it/1uec51) sobre desenvolvimento para web. Fui pedindo [ajuda no Reddit](https://redd.it/1rnfle) e seguindo um [tutorial para desenvolver uma aplicação web](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world). Com isso logo coloquei meu [primeiro projeto](http://whiskyton.herokuapp.com) no ar — [_hell yeah!_]({% post_url 2016-05-19-chega-de-sim-e-ou-hell-yeah-ou-nao %})

Mas eu queria mais. Queria sentir a responsabilidade de ter no ar algo que não fosse apenas um projeto de estudos. Queria um projeto _de verdade_. Não podia ser coisa grande, eu era um novato em Python. Mas tinha que dar o gostinho de ser algo no qual eu não pudesse falhar (ao menos, não grotescamente). E foi bem nessa época que surgiu a oportunidade de um _freela_. Um [amigo](http://miguelzin.com) precisava um site para uma exposição, um _single page application_ com um gerenciador de conteúdo básico.

Juntei o pouco que sabia de Python e pensei: consigo! Orçamento enviado e aprovado, desenvolvimento começando, cliente começando a usar as primeiras versões da aplicação, eu muito contente e… com muito medo.

E se eu errasse? Se eu fizesse alguma besteira com o código, tudo bem, o [git](https://git-scm.com) me salvava. Mas e se eu fizesse algum erro que afetasse o banco de dados, que fizesse meu cliente perder o que ele já havia cadastrado?

Eu estava usando o [Flask](http://flask.pocoo.org), logo precisava de uma extensão para o Flask que fizesse backup do banco de dados. Fui procurar. Não achei. Fiquei incrédulo, mas não achei.

Foi assim que nasceu o AlchemyDumps: do meu receio de perder os dados do cliente. Fui estudar e vi que não era muito complicado. Descobri que o [ORM que eu estava utilizando](http://sqlalchemy.org/) tinha um módulo que fazia quase isso: um [_serializer_ e um método _dumps_](http://docs.sqlalchemy.org/en/rel_1_0/core/serializer.html?highlight=dumps#sqlalchemy.ext.serializer.dumps), ou seja, ele já estava preparado para pegar os dados do banco e me devolvê-los em um formato que eu poderia escrever em arquivo (e, se fosse o caso, importar para o banco de volta sem multa complicação). No mais, foi só fazer uma interface bem básica para o usuário.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I couldn’t find anything interesting googling “SQLAlchemy backup” so I ended up deploying my very 1st <a href="https://twitter.com/hashtag/Python?src=hash">#Python</a> package <a href="http://t.co/m4XAXVSadA">http://t.co/m4XAXVSadA</a></p>&mdash; Cuducos (@cuducos) <a href="https://twitter.com/cuducos/status/533770276732174336">November 15, 2014</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

O que acho legal dessa história é que não comecei com a pergunta _como faço um pacote de código aberto?_ ou _como se inicia no mundo open-source?_ ou nada parecido. Vi uma necessidade, um buraco. Com o que eu tinha em mãos eu pensei que talvez eu conseguiria preencher essa lacuna. Tentei. Deu certo. Resolvi meu problema, passei a dormir em paz. E de quebra coloquei no ar [meu primeiro pacote Python](https://pypi.python.org/pypi/Flask-AlchemyDumps). A necessidade virou oportunidade. E a oportunidade virou um pacote de código aberto. Simples assim.

* * *

Isso foi há uns 2 anos. Hoje o AlchemyDumps é usado por aí. Já foram [9 atualizações](https://github.com/cuducos/alchemydumps#changelog) e [9 pessoas que eu não conhecia](https://github.com/cuducos/alchemydumps#contributors) já contribuíram com o pacote. Mas confesso que ele anda meio parado.

Nas próximas semanas devo dar um recauchutada no pacote todo. Algumas coisas que tenho em mente:

* Resolver [um bug](https://github.com/cuducos/alchemydumps/issues/13) que a comunidade encontrou
* Escrever uma API para ele ser utilizado fora do Flask (fazer backup de qualquer aplicação rodando SQLAlchemy)
* Compatibilidade com o o [CLI do Flask 0.11](http://flask.pocoo.org/docs/0.11/cli/) (e não só com [Flask-Script](http://flask-script.readthedocs.io))
* Usar [Click](http://click.pocoo.org/5/) e melhorar o CLI (cores, testes…)
* Usar [_async_](https://docs.python.org/3/library/asyncio.html) quando der
* Melhoria nos testes (evitar escrever em disco ou no banco de dados, testes de integração)
* Melhoria geral do código (escrevi o grosso dele há 2 anos, tenho muito a reescrever com o que aprendi nesse tempo todo)

Então fica o convite: eu vou estar trabalhando nessas coisas nessas próximas semanas. Se alguém aí estudando Python quiser fazer _pair programming_ comigo, é ótimo para aprender. Não importa teu nível: tenho certeza que eu aprendo contigo e você comigo. Me escreva dizendo da tua disponibilidade (dias, horários…) e interesse que combinamos (tem meus contatos no topo dessa página aqui, na barra lateral).

E, claro, quem quiser por a mão na massa sozinho, fiquem à vontade para _pull requests_ e _code reviews_ ; )