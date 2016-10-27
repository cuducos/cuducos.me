---
layout: blog
title: "Hoje começamos a aprender Elm"
---

Fiquei muito feliz com a galera que se juntou no [grupo do Telegram](https://telegram.me/joinchat/ACJyTAj_HjLqJ5q9UFnATA) e na [lista de emails](https://groups.google.com/d/forum/elm-brasil) depois do meu post [Vamos aprender Elm!]({% post_url 2016-10-24-vamos-aprender-elm %}) No Telegram já somos quase 70 pessoas! Para aquecer o encontro de hoje a noite, resolvi escrever mais algumas linhas. E nos vemos hoje, 20h, no [livecoding.tv](http://livecoding.tv/cuducos).

### Vai ser gravado e disponibilizado depois?

Sim, mas isso já estava lá no post anterior: _Também vou disponibilizar a gravação (para quem não puder ver ao vivo, ou quiser rever algum detalhe)_.

### Preciso saber JavaScript?

Não, aprender [Elm](http://elm-lang.org) não requer saber JavaScript. Na verdade entender o que é um front-end, como o navegador e o [DOM](https://en.wikipedia.org/wiki/Document_Object_Model) funcionam ajuda — mas se não souber, vou resumir isso hoje no nosso encontro.

Só ter uma noção básica de programação já é mais do que o suficiente. O único pré-requisito mesmo é: vontade.

A sintaxe do Elm é parecida com a do [Haskell](https://www.haskell.org), mas não precisa saber Haskell (inclusive eu comecei a estudar Haskell _depois_ de aprender o básico do Elm).

### Qual a minha experiência na área?

Pronto, já veio gente instigar a minha [síndrome do impostor](https://pt.wikipedia.org/wiki/S%C3%ADndrome_do_impostor)… (brincadeira, já não me preocupo mais com isso). Vamos lá:

Não tenho formação oficial na área (sou formado em design gráfico, tenho dois mestrados em sociologia e ciência política, e estou terminando um doutorado em sociologia também). E eu nunca programei com qualquer linguagem de baixo nível (ponteiros? sei o que são mas nunca usei).

Dito isso sou _geek_ desde pequeno. Usava internet quando tinha que ligar pela linha telefônica a uma [BBS](https://en.wikipedia.org/wiki/Bulletin_board_system) ( usando o novíssimo modem Zoltrix 2400) para enviar um email. Aprendi sozinho HTML, CSS, JavaScript no meio da década de 90. Depois trabalhei bastante com [ActionScript](https://en.wikipedia.org/wiki/ActionScript) (script tosquíssimo que rolava dentro do Macromedia Flash, e não sei mais que fim levou; e sim, o Flash não era da Adobe até a Adobe comprar uma empresa que se chamava Macromedia). Façam a piada que for mas foi ali — animando dinamicamente no Flash, trazendo dados de banco de dados para o Flash e etc. — que comecei a aprender e usar orientação a objetos. Felizmente o Flash começou a morrer e depois trabalhei muito com PHP (antes do [Laravel](https://www.laravel.com); para mim [Code Igniter](http://www.codeigniter.com) foi a grande novidade novidade). Flertei com [Rails](http://rubyonrails.org), que estava nas fraldas naquela época, mas antes de fazer mais nada tive uma crise e larguei a tecnologia.

Minha abstnência durou uns 7 ou 8 anos. Em 2013 deu saudades de programar. Retomei aprendendo [Python](https://python.org) e [Ruby](https://www.ruby-lang.org/), [SASS](http://sass-lang.com), [CoffeeScript](http://coffeescript.org) (sim, cheguei atrasado na festa), mas acabei me interessando muito mais sobre o que realmente mudou nesse período: metodologias, arquiteturas, ambientes de desenvolvimento (métodos ágeis, TDD e testes em geral, DRY, PaaS, ferramentas de _devops_ etc.). Me apaixonei por Python e já tenho uns calos em [Django](https://www.djangoproject.com) e [Flask](http://flask.pocoo.org) — ou seja, meu foco continou sendo web.

Me apaixonei por ferramentas que ajudam o desenvolvedor e arrisquei escrever algumas (como o [GetGist](https://github.com/cuducos/getgist) ou o [webassets-elm](https://github.com/cuducos/webassets-elm) por exemplo). Me apaixonei pelo mundo do código aberto e distribuo algumas linhas de código minhas em alguns pacotes que uso. Recentemente comecei a aprender Elm pois odeio (opinião pessoal) o _stack_ JavaScript. Rolou uma química legal entre eu e o Elm. O Elm e a arquitetura dele levam o front-end para um alto nível de abstração (mas sim, isso existe também no [React](https://facebook.github.io/react/) com [Redux](https://github.com/reactjs/redux), que, por sinal, foi [inspirado no Elm](http://redux.js.org/#influences)).

Hoje, juntando tudo da minha trajetória, me vejo como [alguém que usa tecnologia como voz política](http://cuducos.me/2016/05/13/autonomia-meus-ultimos-10-anos.html). Por fim, em um futuro próximo quero ter um caso com [Elixir](http://elixir-lang.org).

## Quero queimar a largada da série, estudar mais, o que você recomenda?

Me desculpem os que não falam inglês. Conheço pouquíssima coisa de Elm em português. Por isso mesmo comecei a agitar essa comunidade aqui. Em português, obviamente, recomendo meu [tutorial introdutório]({% post_url 2016-09-17-porque-elm %}).

Indo para o inglês, essa é a [documentação oficial](http://package.elm-lang.org/packages/elm-lang/core/latest/) do _core_ do Elm, e esse é [o guia oficial sobre a importantíssima arquitetura do Elm](https://guide.elm-lang.org/architecture/). Ambos estão listados na parte de [documentação](http://elm-lang.org/docs) da página oficial do Elm.

E saindo das coisas oficiais, esse foi [um dos posts mais legais](http://ohanhi.github.io/master-elm-1-why-elm.html) que li quando comecei a estudar Elm. Amei também [essa palestra](https://youtu.be/IcgmSRJHu_8) recente sobre como o Elm te permite fazer _estados impossíveis_ da tua aplicação realmente _impossíveis_. E hoje achei [esse artigo muito legal](https://dev.to/dnimmo/i-was-wrong-to-dismiss-elm-and-i-think-you-probably-aretoo) de um desenvolvedor que menosprezou Elm (_tsc ah! mais uma linguagem que compila para JavaScript, deixa pra lá…_) e depois mudou de ideia (e o título diz que se você menosprezou Elm, provavelmente você está errado assim como ele estava). Preste atenção não nos pormenores da linguagem, mas em como a robustez dela e do ambiente que a envolve garantem qualidade (mesmo com mais gente, com difernetes níveis de conhecimento, escrevendo código na mesma aplicação).

Por fim, se você nunca ouviu falar de programação funcional, talvez [essa série de artigos](https://medium.com/@cscalfani/so-you-want-to-be-a-functional-programmer-part-1-1f15e387e536) ajude a quebrar o gelo com os novos paradigmas.

---

Depois que publiquei esse texto o [Marcel](https://twitter.com/marcelgsantos) me contou que ele traduziu para português [a página de Elm no _Learn X in Y minutes_](https://learnxinyminutes.com/docs/pt-br/elm-pt/) — ficou muito bom, então fica a recomendação aqui!