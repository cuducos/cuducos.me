---
layout: blog
title: "Vamos aprender JavaScript para separar as responsabilidades do frontend e do backend"
---

Apesar de projetos robustos de frontend não ser uma das minhas especialidade, várias pessoas que programam e que são próximas vivem tirando dúvida de JavaScript comigo. O que é estranho, pois sou bem tosco em JavaScript.

Mas também é compreensível: a maior parte das minhas respostas não é sobre JavaScript em si, mas sobre como a arquitetura de um projeto permite que frontend e backend se comuniquem. Em outras palavras, as dúvidas não são sobre JavaScript ou um _framework_ específico, mas sobre como separar as responsabilidades do frontend e do backend.

Pensando nisso fiz algumas sessões de _live coding_ mostrando como eu **penso** essa arquitetura. Não foquei nem em código, nem em biblioteca alguma. Usei um backend simples em Django e o restou foi JavaScript puro.

**Fiz assim pois a ideia é falar de arquitetura, não de código (o código vem como exemplo da implementação dessa arquiteura).** Em outras palavras, se é para falar de código, [vai logo pro Elm]({% post_url 2016-10-24-vamos-aprender-elm %}) :)

Sendo assim, tentei destacar o que é responsabilidade do fronend, o que é responsabilidade do backend, e como escrever código que respeite essa divisão de responsabilidades (independente se é Django, Flask, Rails, Express, Code Igniter, Laravel, Iron etc; e independente se é Elm, React, Vue, Angular, Ember…).

O escopo foi mais ou menos esse:

* Criar um aplicação com Django que gerencie uma agenda telefônica
* Propûs uma aplicação não retorna os dados via HTML, os dados só são servidos via JSON:
  * Uma view para listar todos os contatos
  * Uma view que dê os detalhes de um contato
  * Uma view para criar um contato novo
  * Uma view para editar um contato existente
* O frontend é um SPA (_single page application_), independente do Django, onde a gente pode fazer quatro coisas – **e é isso que foi implementado nas sessões**:
  * Ao carregar, ele carrega a lista de contatos
  * Ao clicar em Novo, adicionamos um contato
  * Ao clicar em um contato, ele mostra os detalhes desse contato
  * Ao clicar em Editar podemos editar os dados desse contato

O [código](https://github.com/cuducos/django-ajax-contatcs) foi escrito em mais de [5h de sessões de _live coding_](https://www.youtube.com/watch?v=AW9FcWVHKWk&list=PLUj8WMX6gr49dYxG8jnPwDW-9quA9NEAX) – espero que ajude mais gente além de quem participou das _lives : )

## Parte 1

<iframe width="560" height="315" src="https://www.youtube.com/embed/AW9FcWVHKWk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Parte 2

<iframe width="560" height="315" src="https://www.youtube.com/embed/mA1c7ztyjXI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Parte 3

<iframe width="560" height="315" src="https://www.youtube.com/embed/PhzsW6XmzEU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Parte 4

<iframe width="560" height="315" src="https://www.youtube.com/embed/fPiWWmWSXoc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Parte 5

<iframe width="560" height="315" src="https://www.youtube.com/embed/Yb2OG5iQzAE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
