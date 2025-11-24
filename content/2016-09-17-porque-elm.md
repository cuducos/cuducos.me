---
slug: porque-elm
tags: [pt, Elm, Dev, Frontend]
title: "Porquê Elm: chega de dor de cabeça com front-end, chega de JavaScript"
---

> Baseado na palestra que ofereci no encontro do Grupy-SP, em 17 de setembro de 2016. O código dessa atividade está disponível [no GitHub](http://www.github.com/cuducos/grupy-porque-elm).

## O problema que o Elm resolve

Para entender o porquê eu gosto do [Elm](http://elm-lang.org) precisamos falar sobre duas coisas: JavaScript e [DOM](https://en.wikipedia.org/wiki/Document_Object_Model).

## Precisamos falar sobre JavaScript

Alguém aqui gosta de JavaScript? Eu confesso que dou risada com [algumas coisas do JavaScript](https://www.destroyallsoftware.com/talks/wat):

```javascript
> {} + {}
NaN
> {} + []
0
> [] + {}
"[object Object]"
> [] + []
""
```

Mas deixemos os _memes_ de canto. Arrisco dizer que quem gosta de Python não gosta de JavaScript por três motivos:

1. Existem muitas formas de fazer a mesma coisa, nem todas são óbvias e nem todas funcionam em todos os navegadores. Por exemplo, aqui temos [uma lista de 535 formas de recarregar uma página](http://www.phpied.com/files/location-location/location-location.html). Bateu aquela saudades do [_there should be one – and preferably only one – obvious way to do it_](https://www.python.org/dev/peps/pep-0020/#id3), né?
1. Debugar JavaScript é difícil pois as mensagens de erro padrão são péssimas.  Por exemplo, tentar pegar o primeiro elemento de uma lista vazia, no JavaScript, vai te retornar apenas `undefined`. Bateu saudades do `IndexError: list index out of range`, né?
1. O código é verboso demais no JavaScript — mas reconheço que isso é muito subjetivo. De qualquer forma, quem está acostuamdo com as _list comprehensions_ do Python acha um absurdo usar `for (var i = 0; i < myList.length; i++) { … }`.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">“Maybe this new JavaScript framework will compensate for the fact I haven’t actually learned JavaScript properly” - every front-end dev.</p>&mdash; I Am Devloper (@iamdevloper) <a href="https://twitter.com/iamdevloper/status/646377503708180480">September 22, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Mas não podemos nos livrar do JavaScript – pelo menos não tão cedo. Ele roda em todos os navegadores, assim é a linguagem padrão disponível para UI e UX na web, seja em computadores, tablets ou celulares.

E, por sorte, existem coisas boas no JavaScript!

<p class="center"><a data-flickr-embed="true"  href="https://www.flickr.com/photos/nathansmith/4704268314/in/photolist-7GpUK-6ST9B3-8aGB5o-fTCL3F-9TWvEB-gaya1o-9YqyAw-5f36kS-b57b8-25HCdL-4asvCK-fhJHmi-6a5wWc-9tcEHs-qzq6Zh-7LgmGg-4Xbkrh-a7irkb-friuJ-3X6Eva-kAdNa-8YFiDS-ddoqGv-ir5k7h-5Gs23D-5kxRd2-qNti2-3zS6bR-kAdMR-nYNyx4-tp1D5-9odX5P-gKTzb3-QWFGA-d9UrEv-6an3df-4EcFGg-8KotxH-2yZBLA-6TAYsz-K23BZ-9fZ1Uo-nMEeFu-7JdAbX-73pVad-nVhADg-9p9eiR-pUYo2G-ed9n87-b7diEe" title="JavaScript: Good Parts vs. The Rest"><img src="https://c3.staticflickr.com/5/4066/4704268314_bb0e9d0ff3.jpg" width="500" height="299" alt="JavaScript: Good Parts vs. The Rest"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script></p>

Esse livro da foto, e [essa palestra](https://youtu.be/hQVTIJBZook) do mesmo autor, desmisitificam uma crítica muito comum: _JavaScript é lento_. Não é. O que é lento é o DOM, ou, mais precisamente, alterar o DOM. Então vamos falar sobre o DOM.

## Precisamos falar sobre DOM

O problema com o DOM é que a cada alteração mínima na página, o JavaScript tem que processar a nova entrada, pedir permissão ao navegador para alterar o DOM, destruir o nó que vai ser substituído no DOM, criar o novo nó, recalcular como renderizar a página atualizada (incluindo processar todos os estilos CSS), avisar o navegador que a mudança foi feita e atualizar as referências ao DOM no JavaScript. Tudo isso, digamos, a cada mudança que ocorre na tela (sem que a página toda seja recarregada).

<p class="center"><a data-flickr-embed="true"  href="https://www.flickr.com/photos/w32blaster/7602439048/in/photolist-czNugj-9MXNBX-8YVBdG-8r7Uxg-bWE9EF-6awWxx-2HL4KW-8ukJBe-bE86Mn-2GUYkr-6YJVE4-2ASEPt-5oL6vv-qYJFbv-ekvCg-7Vgjq8-eUxXgA-dVjz68-qbnyg3-jHxg5v-bF4kw2-9EG24D-9sN9Az-9UFbdX-mwjKqK-9p5MN6-97SGSG-fTp6AY-qQcex6-r92iPe-4n4YMA-5NswtU-5zzEc5-5Fggna-7azyaC-d6dswj-zgpzS8-aGaPmc-pLxNkR-gUUGnv-6XDrCu-73wbZe-3cYXt7-hE7nxY-qGEDTv-9LpCVN-aSPbL8-9xgzry-4FCUZX-9toZqH" title="Facebook notifications"><img src="https://c1.staticflickr.com/8/7113/7602439048_e6e4436115_o.jpg" width="355" height="211" alt="Facebook notifications"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script></p>

Imagine você no Gmail ou Facebook: uma mensagem nova chega no chat, tem uma notificação com o número de mensagens que aparece, a janela de chat aparece e pisca, o nome da pessoa fica diferente na lista de amigos. E ao mesmo tempo a página segue mudando com mais um email, mais um comentário, etc. Cada coisinha dessa requereria uma sequência como a do parárafo anterior. É muita alteração no DOM e isso tende a ser custoso.

Para resolver esse problema a ideia foi criar um DOM virtual. A cada mensagem nova no chat, ao invés do JavaScript sair alterando cada coisinha no DOM, primeiro ele processa _todas_ as alterações em um DOM virtual. Depois ele compara o DOM virtual com o DOM real e altera-o uma única vez. Essa é a estratégia de vários _frameworks_ como o [React](https://facebook.github.io/react/) e o [Vue](https://vuejs.org/), ou mesmo a estratégia de front-end do [AngularJS](https://angularjs.org) ou do [Ember.js](http://emberjs.com).

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">“The Top 100 JavaScript Frameworks of 2015″<br><br>ಠ_ಠ this is an issue.</p>&mdash; I Am Devloper (@iamdevloper) <a href="https://twitter.com/iamdevloper/status/661168082572939265">November 2, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Isso resolveu o problema do custo da alteração do DOM. Mas não resolveu a nossa dependência do JavaScript para isso. Até que chegou o Elm.

## Bem vindo, Elm

O Elm chegou com várias promessas ótimas. Ele promete ser [mais rápido](http://elm-lang.org/blog/blazing-fast-html-round-two) que as alternativas mencionadas anteriormente:

<img src="media/2016-09-17-porque-elm-01.png" alt="Elm: Blazing Fast HTML, Round Two">

E, entre outras coisas, promete _no runtime exceptions_, ou seja, sem erros na hora do usuário executar a aplicação. A [NoRedInk](https://www.noredink.com), pioneira na adoção do Elm, tem uma aplicação em Elm de mais ou menos 36 mil linhas, rodando há 1 ano. Zero erros reportados.

Mas… como o Elm consegue? Esse é o foco da palestra.

### Primeiros passos

O primeiro passo para entender como o Elm consegue resolver esse problema é entender que ele não é só uma linguagem que compila para JavaScript. Ele oferece um ambiente de desenvolvimento único, sem paralelos com JavaScript. No final, por _acaso_, ele vira um `.js` para você integrar na aplicação. Por _acaso_ pois ele não depende do JavaScript e, se um dia os navegadores suportarem outra linguagem, ou mesmo Elm, o JavaScript some de cena sem deixar vestígios no ambiente de desenvolvimento Elm.

Elm é uma outra linguagem, com outra lógica, e com compilador próprio. Ela é uma linguagem funcional, trabalha com constantes e expressões — sempre.

#### Conhecendo a sintaxe e as mensagens de erro

Depois de [instalar o Elm](https://guide.elm-lang.org/get_started.html), vamos brincar um pouco para sentir como ele é. Faremos isso abrindo o console, o _read–eval–print loop_, com `$ elm-repl`:

```elm
> "Ahoy"
"Ahoy" : String
> 3.1415
3.1415 : Float
> ["Ahoy", "Cap'n"]
["Ahoy","Cap'n"] : List String
```
No Elm os tipos importam muito. E ele usa isso para verificar várias possibilidades de erro no código — e não compila enquanto você não resolver esses problemas em potencial. Vamos a alguns exemplos:

Que tal tentar juntar um número inteiro com uma string?

```console
> 42 + "Ahoy"
-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

The right argument of (+) is causing a type mismatch.

3|   42 + "Ahoy"
          ^^^^^^
(+) is expecting the right argument to be a:

    number

But the right argument is:

    String

Hint: To append strings in Elm, you need to use the (++) operator, not (+).
<http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#++>

Hint: I always figure out the type of the left argument first and if it is
acceptable on its own, I assume it is "correct" in subsequent checks. So the
problem may actually be in how the left and right arguments interact.
```

Reparem como a mensagem de erro é clara: `TYPE MISMATCH` te diz qual o tipo do erro (o tipo de um valor não é o que o compilador espera), tem um `^^^^^^` sublinhando, na devida linha, qual valor é esse. Ainda tem uma dica: para concatenar texto, use `++` ao invés de `+`. E, por fim, um exclarecimento: ele diz que é o texto, e não o número, que ele acredita ser o problema pois ele começa avaliando o valor da esquerda, sempre. Se a gente tivesse colocado `"Ahoy" ++ 42`, ele reclamaria que o `42` não é texto.

Outro exemplo: o `Maybe`. Imagine uma cenário onde, por algum motivo, você precisa do primeiro elemento de uma lista. Mas imagine que por algum motivo (talvez ainda desconhecido) aquela lista chegou ali vazia. No Python temos um `IndexError`, como já vimos. E no Elm?

```elm
> import List
> List.head [1, 2, 3]
Just 1 : Maybe.Maybe number
```

Faríamos assim com uma lista contendo três elementos. Mas repare no detalhe do tipo que essa função retornou, `Just 1`, e no tipo que essa mesma função retorna quando passamos uma lista vazia, o `Nothing`:

```elm
> List.head []
Nothing : Maybe.Maybe a
```

O Elm sabe que uma lista pode ser vazia. E não te deixa esquecer disso. Quando você for usar um valor que vem de uma lista, você tem que prever esse cenário. Por isso ele não retorna um número, no nosso caso, logo de cara. Ele retorna `Just 1` ou `Nothing` — sendo que `1` é o primeiro item da nossa lista.

Se quisermos somente o número, sem o tipo `Just <número>`, podemos dizer qual é o valor padrão:

```elm
> Maybe.withDefault 0 (List.head [])
0 : number
```

É com estruturas e lógicas como essa que o Elm consegue prometer – e cumprir — a promessa de não deixar passar erros.

#### Compilando e colocando a mão na massa

Mas e como desenvolvemos algo _de verdade_? Bom, vamos por partes.

Comecemos com um arquivo simples, `Main.elm`:

```elm
module Main exposing (..)

import Html exposing (text)


main =
    text "Ahoy"
```

Todo arquivo Elm que vai ser compilado espera uma função `main`. E essa função `main` tem que retornar um `Html` — afinal, o Elm é pensando para produzir interfaces para navegadores.

Então importamos uma função, `text`, que retorna um `Html`. Depois definimos que a função `main`: ela retorna seja lá o que for que aquela função `Html.text` produzir quando passarmos a ela um texto `"Ahoy"`.

A primeira linha é padrão em todo arquivo Elm: você dá um nome ao módulo que está criando ali naquele arquivo (e esse nome tem que bater com o nome do arquivo). O `(..)` define o que desse módulo é acessível externamente — algo com o que não precisamos nos preocupar agora (`..` define que tudo é acessível externamente).

Feito isso, é só compilar: `$ elm-make Main.elm`. Inspecionando o diretório, vamos ver quatro arquivos:

* `Main.elm` é o nosso código fonte.
* `index.html` é o nosso código compilado em HTML, com o JavaScript embutido, pronto para rodar no navedagor — não tenha medo, abra para ver como ficou!
* `elm-package.json` e `elm-stuff` são criados pelo próprio Elm para controlar teu projeto.

Se quisermos compilar somente o JavaScript, para incluí-lo no HTML separadamente, podemos: `$ elm-make Main.elm --output app.js` gera o arquivo `app.js`, que pode ser [incluído em qualquer HTML posteriormente](https://guide.elm-lang.org/interop/html.html).

Para desenvolvermos — e brincarmos — temos ainda o `$ elm-reactor`, uma ferramenta que faz tudo isso automaticamente para você poder se focar no que importa: escrever código. Vamos usar o Reactor logo logo.

### A chave de ouro: a arquitetura do Elm

Já vimos que o compilador ajuda o Elm a não deixar passar chances de erro. Já vimos que o Elm controla o tipo de cada valor para ter certeza que as funções recebem os argumentos do tipo correto e sempre retornam algo esperado. Mas ainda não falamos do principal: [a arquitetura do Elm](https://guide.elm-lang.org/architecture/).

Essa arquitetura foi tão bem aceita que até quem não programa em Elm se inspirou nela: o Redux, muito usado no mundo do ReactJS, se inspirou na arquitetura do Elm (eles contam isso [no GitHub](https://github.com/reactjs/redux#influences), e na [documentação](http://redux.js.org/docs/introduction/PriorArt.html#elm)).

Nos termos do Elm isso quer dizer que toda aplicação é organizada em torno de três objetos principais:

1. Um modelo (normalmente um tipo `Model`) com os dados necessários para renderizar uma interface.
1. Uma função (`view`)  que recebe como argumento um modelo e retorna um HTML de como aqueles dados são renderizados (na verdade aqui estamos falando do módulo `Html` do Elm, e não de um arquivo `.html`).
1. Uma função (normalmente `update`) que recebe como argumento uma mensagem e um modelo, e retorna um novo modelo com as informações atualizadas de acordo com a mensagem recebida (uma mensagem pode ser, por exemplo, um clique no botão _Enviar_ em um espaço de comentários).

Vamos ver como isso funciona abrindo o `$ elm-reactor` no terminal e abrindo a URL do servidor que ele cria ([`localhost:8000`](http://localhost:8000)) no navegador.

<img src="media/2016-09-17-porque-elm-02.png" alt="Elm Reactor">

Clicando em [`Main.elm`](http://localhost:8000/Main.elm) (ou em qualquer arquivo Elm) o Reactor já compila e mostra o resultado no navegador. Então vamos começar a aprender um pouco mais de Elm e testar sua arquitetura criando uma caixa de comentários.

#### Nosso modelo de dados

Vamos pensar quais dados precisamos para ter uma caixa de comentário:

* Cada comentário tem que ter dois campos de dados, um para armazenar conteúdo do comentário e outro para armazenar o nome de quem fez esse comentário.
* Precisamos de um lugar para guardar cada um dos comentários; uma sequência de elementos que tem a mesma estrutura.
* E ainda precisamos de um lugar para guardar um comentário novo enquanto ele é digitado. Na UI vai ser o `textarea` do nosso HTML, mas precismaos trazer ele para o nosso modelo.

Com isso, vamos começar a editar nosso `Main.elm` criando um tipo específico para nossos comentários:

```elm
type alias Comment =
    { author : String
    , contents : String
    }
```

O Elm já tem vários tipos de dados como `Integer`, `Float`, `String`, `List`, etc. Ele também nos permite criar nossos próprios tipos. Para isso usamos `type alias`, estamos combinando tipos existentes para formar um novo tipo que batizamos de `Comment`. Assim, quando passarmos um comentário como argumento para alguma função, o compilador sabe que a descrição desse tipo é essa: um _Record_ (tecnicamente é isso que criamos utilizando as chaves) que tem dois campos nomeados, um chamado `author` e que será do tipo texto (`String`), e outro, também do tipo texto, que é o `contents`.

E vamos criar também um modelo nosso:

```elm
type alias Model =
    { new = Comment
    , comments = List Comment
    }
```

Temos duas novidades aqui: primeiro, uma vez que já temos um tipo `Comment`, criado no passo anterior, já podemos utilizá-lo para criar novos tipos; segundo, quando definimos uma lista, temos que informar qual o tipo dos elementos dessa lista — logo, ao contrário do Python, uma lista em Elm não pode ter tipos misturados. Por exemplo, ao tentarmos criar umas lista com `"Ahoy"` (texto) e `42` (número inteiro), temos um erro que diz que o primeiro e o segundo elementos da lista não são do mesmo tipo:

```console
> ["Ahoy", 42]
-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

The 1st and 2nd elements are different types of values.

3|   ["Ahoy", 42]
              ^^
The 1st element has this type:

    String

But the 2nd is:

    number

Hint: All elements should be the same type of value so that we can iterate
through the list without running into unexpected values.
```

Por isso definimos que nosso modelo tem dois campos: um `new` onde guardamos nome do autor do comentário e o conteúdo do comentário; e uma lista de comentários na qual cada um tem seu próprio autor e conteúdo.

Podemos declarar uma constante que seria o equivalente a uma caixa de comentários vazia:

```elm
initialModel =
    { new =
        { author = ""
        , contents = ""
        }
    , comments = []
    }
```

Ou, por exemplo, uma em que já teríamos dois comentários postados, e um sendo digitado:


```elm
initialModel =
    { new =
        { author = "John Doe"
        , contents = "Ahoy, cap'n"
        }
    , comments =
        [ { author = "Joane Doe"
          , contents = "What be happenin', matey?"
          }
        , { author = "Buccaneer"
          , contents = "What say ye, ya scurvy dog?"
          }
        ]
    }
```

Ainda podemos, antes de declarar a constante, especificar que ela deve seguir os tipos do nosso `Model` criado anteriormente:

```elm
initialModel : Model
initialModel =
    { new =
        { author = ""
        , contents = ""
        }
    , comments = []
    }
```

A vantagem de fazer isso é que se errarmos na hora de criar nosso `initialModel`, o Elm nos avisa e não deixa o erro passar. Se, por engano, digitarmos `name` ao invés de `author`, o Elm pega:

```console
Detected errors in 1 module.


-- TYPE MISMATCH ------------------------------------------------------ Main.elm

The type annotation for `initialModel` does not match its definition.

18| initialModel : Model
                   ^^^^^
The type annotation is saying:

    { ..., new : { ..., author : ... } }

But I am inferring that the definition has this type:

    { ..., new : { ..., name : ... } }
```

Pronto, já temos nosso modelo declarado e um valor inicial para ele. Se você se perdeu, é isso que adicionamos ao nosso `Main.elm`:

```elm
type alias Comment =
    { author : String
    , contents : String
    }


type alias Model =
    { new : Comment
    , comments : List Comment
    }


initialModel : Model
initialModel =
    { new =
        { author = ""
        , contents = ""
        }
    , comments = []
    }
```

#### Nossa função _view_

Agora vamos substituir aquele `text "Ahoy"` por uma função `view`. Essa função recebe um modelo e retorna um HTML. No Elm temos o módulo `Html` com praticamente todos os _tags_ do HTML nativo, assim podemos escrever nossa própria interface em Elm. No módulo de HTML do Elm toda tag é uma função que leva como argumento duas listas: uma com os atributo que essa _tag_ leva e outro com os nós que ficam dentro dela.

Vamos a alguns exemplos:

```heskell
import Html exposing (p, text)

p [] [ text "Ahoy" ]
```

Isso no final das contas é uma tag `p`, sem nenhum atributo e tem um nó de texto com `Ahoy` dentro. Ou seja, `<p>Ahoy</p>`.

```elm
import Html exposing (p, text)
import Html.Attributes exposing (class)

p [ class "alert" ] [ text "Ahoy" ]
```

Agora esse código recebeu uma lista não-vazia de argumentos, logo equivale a `<p class="alert">Ahoy</p>`.

```elm
import Html exposing (p, strong, text)
import Html.Attributes exposing (class)

p
    [ class "alert" ]
    [ text "Ahoy, "
    , strong [] [ text "cap'n" ]
    , text "!"
    ]
```

Agora temos uma _tag_ dentro de outra: `<p class="alert">Ahoy, <strong>cap'n</strong>!</p>`.

É essa mesma estrutura que vamos utilizar na nossa `view`. A assinatura dela é receber um `Model` e devolver esses elementos de HTML, o que em Elm dizemos assim:

```elm
view : Model -> Html.Html a
```

Esse `Html.Html a` parece um pouco complicado. Basicamente o `Html.Html` quer dizer _o tipo `Html` dentro do módulo `Html`_. Já o `a` vamos usar quando criarmos nossa função `update` — guarde ele aí. O importante é entender que essa função vai receber um modelo e devolver HTML.

Vamos, por enquanto, só renderizar um parágrafo dizendo _Temos 0 comentários_, _Temos 1 comentário_, _Temos x comentários_, de acordo com quanto elementos tivermos no nosso modelo.

O módulo de listas do Elm pode nos facilitar a vida. Ele tem a função `List.length` que recebe uma lista e retorna um número inteiro (no formato da assinatura do Elm, `List a -> Int`).

Então o texto que queremos mostrar vai ser a junção de duas coisas: o valor retornado por `List.length`, transformado para texto, mais  o texto `comentários` (depois cuidamos do plural). Isso quer dizer algo como:

```elm
view : Model -> Html.Html a
view model =
    p [] [ text ((toString (List.length model.comments)) ++ " comentários") ]
```

Esse código está péssimo. Muito fácil se perder nos parênteses. Vamos usar uma estrutura do Elm pra facilitar isso, depois explicamos mais sobre ela:

```elm
view : Model -> Html.Html a
view model =
    let
        count =
            List.length model.comments

        phrase =
            (toString count) ++ " comentários"
    in
        p [] [ text phrase ]
```

Melhorou, né? A primeira linha é a assinatura que já falamos. A segunda linha define uma função `view` que recebe um único argumento (`model`). Para simplificar vamos dizer que tudo que está dentro do `let` são constantes que só serão válidas dentro do `in` subsequente.

Dentro do `let` temos um número inteiro `count`, que é transformado para texto quando o utilizamos na constante `phrase`.

Se quiser ver nosso modelo e view funcionando, é só trocar `main` por:

```elm
main =
    view initialModel
```

No navegador já é possível ver _0 comentários_, ou _2 comentários_ se usar nossa versão preenchida do `initialModel`.

Antes de fechar nossa `view` precisamos fazer três coisas:

* Cuidar do plural (_comentários_) e do singular (_comentário_) no código que já temos
* Incluir um formulário para receber novos comentários
* Incluir os comentários, caso existam

##### Plural e singular

Essa é a mais simples: o que precisamos é de uma função `Int -> String`, ou seja, passamos um número inteiro (`0`, ou `1`, ou `2` etc.) e ela nos devolve `"comentário"` quando passamos `1`, ou `"comentários"` quando passamos qualquer outro número:

```elm
pluralize : Int -> String
pluralize count =
    if count == 1 then
        "comentário"
    else
        "comentários"
```

E já podemos usá-la na nossa `view` substituindo a antiga `phrase` por:

```elm
phrase =
    (toString count) ++ " " ++ pluralize count
```

##### Mostrando um formulário

Nosso formulário só vai ganhar vida quando tivermos nossa função de `update` que vai pegar o que for digitado e salvar no modelo. Então por enquanto é só usar o HTML do Elm. Expomos mais algumas _tags_ e atributos e ficamos com esse resultado:

```elm
import Html exposing (br, button, div, form, input, p, text, textarea)
import Html.Attributes exposing (value)

--
-- ...
--

view : Model -> Html.Html a
view model =
    let
        count =
            List.length model.comments

        phrase =
            (toString count) ++ " " ++ pluralize count
    in
        div
            []
            [ p [] [ text phrase ]
            , form
                []
                [ input [ value model.new.author ] []
                , br [] []
                , textarea [ value model.new.contents ] []
                , br [] []
                , button [] [ text "Enviar" ]
                ]
            ]
```

São muitas linhas novas, mas é só HTML escrito de uma forma um pouco diferente: usando função, lista de atributos, e lista de nós (de outros _tags_ HTMLs). A única coisa a se atentar ali é que usamos o `new` do nosso modelo para preencher o `input` e o `textarea` — se você usar a versão preenchida do `initalModel`, já vai ver no navegador um pirata comentando algo ali.

##### Mostrando os comentários

Para começar vamos fazer uma nova função que recebe um comentário só (tipo `Comment` que criamos) e retorna HTML (`Comment -> Html.Html. a`):

```elm
viewComment : Comment -> Html.Html a
viewComment comment =
    p
        []
        [ text (comment.author ++ ":")
        , br [] []
        , text comment.contents
        ]
```

Isso vai gerar algo como `<p>Buccaneer:<br>What say ye, ya scurvy dog?</p>`.

Agora vamos usar o `List.map` para aplicar essa função em cada um dos comentários existentes no nosso modelo. Essa função recebe dois argumentos: o primeiro é uma outra função, o segundo é uma lista. O `List.map` aplica esse função a cada um dos elementos da lista e retorna uma nova lista com os resultados.

Na prática a única novidade na nossa `view` é o `div [] (List.map viewComment model.comments)`:

```elm
view : Model -> Html.Html a
view model =
    let
        count =
            List.length model.comments

        phrase =
            (toString count) ++ " " ++ pluralize count
    in
        div
            []
            [ p [] [ text phrase ]
            , div [] (List.map viewComment model.comments)
            , form
                []
                [ input [ value model.new.author ] []
                , br [] []
                , textarea [ value model.new.contents ]  []
                , br [] []
                , button [] [ text "Enviar" ]
                ]
            ]
```

#### Dando vida aos comentários

A função `update` é a mais complexa. Ela recebe um modelo e uma mensagem, para retornar uma versão atualizada do modelo. Por exemplo, nosso tutorial terá três mensagens:

* a ação de atualizar um novo nome em um novo comentário (ou seja, guardar o que for digitado no modelo no `Model.new.author`);
* a ação de digitar um novo comentártio (ou seja, guardar o que for digitado no modelo, no `Model.new.contents`);
* e a ação de postar um novo comentário (adicionar o conteúdo do `Model.new` à lista `Model.comments` e limpar o `Model.new`).

```elm
type Msg = UpdateAuthor String | UpdateContents String | PostComment
```

Criamos um novo tipo, o `Msg`. Não é um `type alias` como antes pois não estamos criando tipos com base nos que já existem. Estamos literalmente criando tipos novos. E o que estamos dizendo é que o tipo `Msg` só pode ser três coisas:

* ou um `UpdateAuthor` acompanhando de um texto;
* ou um `UpdateContents` acompanhando de um texto;
* ou um `PostComment.

Essas são as mensagens que precisamos e é o nosso HTML (o tipo `Html.Html`, no caso) que vai produzí-las. Esse é o significado do `a` na assinatura da nossa `view`: qual o tipo de mensagem que nosso HTML vai produzir? Agora podemos atualizar nossa `view` e especificar que será uma dessas mensagens que definimos no tipo `Msg` (e podemos fazer o mesmo com a `viewComments`):

```elm
view : Model -> Html.Html Msg
```

Falando na `view`, podemos importar alguns eventos do módulo `Html`: o `onInput` para quando tiver qualquer alteração nos dados do `input` ou do `textarea`, e o `onSubmit`, que captura o momento que um formulário foi enviado.

```elm
import Html.Events exposing (onInput, onSubmit)

--
-- ...
--

view : Model -> Html.Html Msg
view model =
    let
        count =
            List.length model.comments

        phrase =
            (toString count) ++ " " ++ pluralize count
    in
        div
            []
            [ p [] [ text phrase ]
            , div [] (List.map viewComment model.comments)
            , form
                [ onSubmit PostComment ]
                [ input [ value model.new.author, onInput UpdateAuthor ] []
                , br [] []
                , textarea [ value model.new.contents, onInput UpdateContents ] []
                , br [] []
                , button [] [ text "Enviar" ]
                ]
            ]
```

Não se perca. Foram três alterações:

1. Adicionamos`onSubmit PostComment` como um atributo do `form`;
2. Adicionamos `onInput UpdateAuthor` como segundo atributo do `input`;
3. E adicionamos `onInput UpdateContents` como segundo atributo do `textarea`.

Assim, quando o usuário interagir com o formulário o aplicativo já dispara as mensagens para o `update`. O que está faltando é escrever o que acontece em cada caso.

No caso do `UpdateAuthor` ou `UpdateContents` a ideia é pegar o texto que vier junto com a mensagem e atualizar, respectivamente, o `new.author` e o `new.comments`. Feito isso é só retornar uma nova versão do modelo. Vamos ver como começamos:

```elm
update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAuthor value ->
            let
                new =
                    model.new

                updated =
                    { new | author = value }
            in
                { model | new = updated }

        UpdateContents value ->
            model

        PostComment ->
            model

```

Temos a nossa função `update` cuidando de somente um caso. Ela recebe a mensagem (`msg`) e o modelo (`model`), e verifica qual o tipo da mensagem (`case msg of`). Caso a mensagem seja do tipo `UpdateContents` ou `PostComment` ela retorna o modelo sem mudar nada (implementaremos isso já já). Mas caso a mensagem seja do tipo `UpdateAuthor` ela segue a expressão `let`/`in` declarada aí. A sintaxe é nova, então vamos com calma!

Imagine que você tenha esse `Comment`:

```elm
myComment : Comment
myComment =
    { author = "Buccaneer"
    , contents = "What say ye, ya scurvy dog?"
    }
```

Se você quiser atualizar esse `Comment` para obter um cujo o `author` seja `"Scurvy dog"`, você poderia trocar o `author` e manter o `contents`:

```elm
myNewComment : Comment -> Comment
myNewComment comment =
    { author = "Scurvy dog"
    , contents = comment.contents
    }
```

Isso é simples em um `Record` que não tem muitos campos mas imagine como seria a repetição caso nosso `Comment` tivesse [mais de 25 campos](https://github.com/datasciencebr/jarbas/blob/master/jarbas/frontend/elm/Document.elm#L20)? É para isso que a sintaxe que usamos serve, para manter tudo intacto, menos menos o que for declarado após o _pipe_ (`|`). Por exemplo, essa função abaixo faz a mesma coisa que a de cima: mantém todos os campos intactos, salvo o `author`.

```elm
myNewComment : Comment -> Comment
myNewComment comment =
    { comment | author = "Scurvy dog" }
```
É isso que usamos na nossa `update`:

1. Dentro do `let` isolamos o `new` (com `new = model.new`).
2. Criando a constante `updated` atualizamos somente o campo `author` do `new` (com `updated = { new | author = value }`, sendo que `value` é o texto que veio junto com a mensagem `UpdateAuthor String`).
3. E depois, no `in` atualizamos o próprio modelo com `{ model | new = updated }`.

Para fazer o `UpdateContents`, a lógica é a mesma. Para fazer `PostComment` vamos adicionar o `new` como um novo elemento da lista `comment`, depois limpar os campos do `new`. Juntando tudo, temos:

```elm
update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAuthor value ->
            let
                new =
                    model.new

                updated =
                    { new | author = value }
            in
                { model | new = updated }

        UpdateContents value ->
            let
                new =
                    model.new

                updated =
                    { new | contents = value }
            in
                { model | new = updated }

        PostComment ->
            let
                comments =
                    List.append model.comments [ model.new ]
            in
                { model | new = Comment "" "", comments = comments }
```

Alguns detalhes:

* `Comment "" ""` é um atalho para `{ author = "", contents = "" }` — qualquer tipo criado também cria seu construtor, que por sua vez recebe os argumentos na ordem em que o tipo foi criado (por exemplo `Comment "Scurvy dog" ""` cria `{ author = "Scurvy dog", contents = "" }`, enquanto `Comment "" "Ahoy"` cria `{ author = "", contents = "Ahoy" }`).
* `List.append` espera duas listas como argumento, então envolvemos `model.new` nos colchetes, ou seja, passamos ele para uma lista de um elemento só (`[ model.new ]`) pois o `List.append` não aceitaria `Comment` como segundo argumento (ou seja, o correto é `List.append model.comments [ model.new ]` e não `List.append model.comments model.new`).

##### Ligando os pontos

Depois dessa complicação toda da função `update` você abriu o navegador e não funcionou ainda… que desastre de tutorial.

O que falta é criar uma aplicação que liga os fios entre o modelo, a `update` e a `view`. Vamos importar esse aplicativo atualizar nossa `main`:

```elm
import Html.App

--
-- ...
--

main : Program Never
main =
    Html.App.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }

```

Que tal [brincar no navegador](http://localhost:8000/Main.elm) agora?
