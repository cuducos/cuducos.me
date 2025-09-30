---
layout: post
lang: pt
title: Elm e produtividade
---

Recebo quase sempre perguntas de gente interessada em [Elm](http://elm-lang.org) mas com dúvida sobre produtividade: adotar Elm vai resultar em uma time mais produtivo?

A pergunta que eu sempre devolvo nesse ponto é a seguinte: _o que é importante nessa tua produtividade?_ Digo isso pois o foco no Elm não é rapidez (por mais que seja totalmente compatível com métodos ágeis, TDD etc.). O ponto forte do Elm é mais relacionado a robustez no ambiente de desenvolvimento para garantir estabilidade da aplicação e facilidade de manutenção.

Rapidez faz muito sentido nos momentos em que precisamos de um protótipo rápido, um MVP, por exemplo. Mas se o foco é estabilidade e facilidade de manutenção no médio/longo prazo (coisas sem sentido para um protótipo ou MVP) aí a robustez da arquitetura do Elm faz a diferença.

O ponto é que para um produto de front-end ser robusto e de fácil manutenção é necessário, normalmente, um stack mais ou menos assim: [npm](https://www.npmjs.com) ou [Yarn](https://yarnpkg.com/), [webpack](https://webpack.js.org), [React](https://facebook.github.io/react/), [Redux](http://redux.js.org), [Immutable.JS](https://facebook.github.io/immutable-js/). Além da adoção de melhores práticas, programação funcional e guias de estilo. E isso ainda sem falar de outras possibilidades como [Vue](https://vuejs.org) ou [TypeScript](http://www.typescriptlang.org).

Todas as vantagens trazidas pelo combinado dessas tecnologias, ferramentas e guias a arquitetura do Elm já traz por padrão. Tudo isso não só está disponível por padrão, mas é garantido por padrão pelo compilador. Ou ainda, em outras palavras: a comparação em temos de produtividade não é simplesmente entre React ou Vue e Elm. A comparação teria que ser entre duas aplicações com porte que justifiquem essa arquitetura todas.

Com tudo isso não quero passar a ideia de que estou defendendo o Elm. Acho que ele resolve muito bem alguns tipos de problemas. Mas para responder a pergunta preciso entender melhor o que é produtividade para cada pessoa que me pergunta isso.  Por exemplo: vez o outra desenvolvo aplicativos para campanhas específicas. Aplicativos simples, de vida curta, que serão usados alguns meses, mas não alguns anos. Entregar isso rápido é produtividade.

Mas outras vezes desenvolvo aplicativos que tendem a se tornar produto que deve ser usado por alguns anos pelo menos, cenário onde o médio e longo prazo é importante… E aí acho que produtividade é algo mais complexo, pois você corre sérios riscos de cair em [débito técnico](https://medium.com/@joaomilho/festina-lente-e29070811b84), por exemplo. Nesse cenário, então, produtividade tem que ser entregar valor hoje, sem optimização precoce, mas com alguma estabilidade que permita refatoração sem dor de cabeça no futuro. Elm te dá essa segurança de um ambiente tão robusto que só com coisas que vem com ele por padrão você já tem um processo refatoração é uma delícia e não um caos:

> Elm has the best refactor experience of all time, of all time!<br>
> — [Rogério Chaves](https://github.com/datasciencebr/jarbas/pull/138)