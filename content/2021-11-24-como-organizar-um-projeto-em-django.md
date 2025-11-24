---
slug: como-organizar-um-projeto-em-django
tags: [pt, Python, Dev, Django, Backend]
title: Como organizar um projeto em Django
---

Em 2016 começamos a [Operação Serenata de Amor](serenata-de-amor.html) e uma das necessidades da nossa equipe de cientistas de dados era ter uma ferramenta fácil para ver os detalhes de qualquer reembolso específico feito pela Câmara dos Deputados a parlamentares. Assim [nasceu o Jarbas](https://github.com/okfn-brasil/jarbas/commit/9f79dbf8b6776d0fe35bfef7820e5625847330b5), uma aplicação web para te dar de bandeja tudo o que a Serenata sabia sobre um reembolso.

Na época eu era um novato em Django e praticamente tudo que eu sabia havia aprendido no [Welcome to the Django](https://henriquebastos.net/produtos/welcome-to-the-django/) do [Henrique Bastos](https://henriquebastos.net). Então uma pessoa interessada em contribuir para o projeto [comentou](https://github.com/okfn-brasil/jarbas/issues/28) que a forma como organizamos o código do Jarbas era atípica, não seguia o padrão que ela estava acostumada, que era esse a seguir:

```
jarbas/
    manage.py
    core/
        __init__.py
        admin.py
        models.py
        tests.py
        views.py
    jarbas/
        __init__.py
        settings.py
        urls.py
        wsgi.py
```

Sendo uma pessoa novata na área, respondi que não sabia exatamente o porquê da decisão de organizar como estava organizado, algo como:

```
jarbas/
    core/
        __init__.py
        admin.py
        models.py
        tests.py
        views.py
    __init__.py
    settings.py
    urls.py
    wsgi.py
manage.py
```

Além disso, comentei que apesar de eu saber que essa arquitetura que a pessoa sugeria era super comum (inclusive utilizada na documentação e em livros renomados como o _Two Scoops of Django_), eu achava que ela era confusa: no primeiro exemplo, `jarbas` e `core` estão no mesmo nível na hierarquia de arquivos (e módulos do Python) mas eles não são a mesma coisa; um é um aplicativo construído para o Django que nós escrevemos (com modelos, testes etc.), enquanto outro é o projeto Django em si (com as ferramentas básicas, configurações, arquivos gerados automaticamente etc.).

E marquei o próprio Henrique para convidá-lo a entrar no papo. E ele o fez trazendo  boas razões por trás da arquitetura que utilizávamos. Segundo ele, o principal é o seguinte:

* O diretório do repositório deve ser a raiz de tudo: código, documentação, utilitários etc.
* O projeto em Django deve ser um único pacote em Python, contendo todos seus submódulos e recursos, e deve estar na raiz do repositório.
* O projeto deve seguir a maioria dos [princípios de organização de diretórios em projetos UNIX](https://www.tau.ac.il/~tsirel/dump/Static/knowino.org/wiki/Unix_directory_structure.html) (`doc`, `man`, `contrib` etc.), mas ao invés de utilizar o diretório `src`, utilizar o nome do projeto como é convencional no Python.
* O projeto deve conter o mínimo possível de subdiretórios, evitando, assim, ferramentas para criar padrões conhecidas como _boilerplate_ e _cookie cutters_.
* Começar com um aplicativo em Django chamado `core` para ser o núcleo do projeto, evitando, assim, criar uma quantidade demasiada de aplicativos em Django dentro do projeto.
* Evitar muitos arquivos `requirements.txt`, tentando manter apenas dois caso o ambiente de desenvolvimento seja muito complexo; o ambiente de desenvolvimento deve ser o mais semelhante possível ao de produção para evitar fricção.

Ele ainda ressaltou alguns outros pontos relevantes, que envolvem esses princípios:

* Sempre utilizar [desenvolvimento guiado por testes](https://pt.wikipedia.org/wiki/Test-driven_development), conhecido pela sigla em inglês TDD; dessa forma reorganizar a arquitetura e adaptar o código é considerado apenas um processo natural de evolução da aplicação (e assim os submódulos dentro da aplicação evoluem junto também)
* Utilizar diretórios `static` e `templates` na raiz do projeto, bem como utilizar `AppDirectoryLoaders`; muitas aplicações em Django que são submódulos acabam virando bibliotecas separadas do projeto principal, então essa prática influencia e facilita o processo de desenvolvimento 
* O Django mistura no `settings.py` configurações do projeto e configurações de instância do projeto, mas com ferramentas que leem variáveis de ambiente ou arquivos de configuração (como `.env` por exemplo) podemos evitar múltiplos arquivos `settings.py`

Em resumo, o objetivo é ter uma base de código concisa, testada e que pode ser utilizada tranquilamente em diversas instâncias: em desenvolvimento, em produção, em testes, em demonstrações etc.
