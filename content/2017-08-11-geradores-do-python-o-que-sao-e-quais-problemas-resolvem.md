---
slug: geradores-do-python-o-que-sao-e-quais-problemas-resolvem
tags: [pt]
title: "Geradores do Python: o que são e quais problemas resolvem"
---

Outro dia um amigo viu eu escrevendo uma _função_ em Python que usava `yield` ao invés de `return` e perguntou:

> — Qual a utilidade disso? Nunca entendi…

Na verdade eu estava escrevendo um _gerador_ e não uma _função_. A sintaxe é basicamente a mesma, a única diferença é o que meu amigo reparou: o `yield` ao invés do `return`. Mas e aí? Para que serve?

Um função retorna um valor e pronto, digamos que se encerra ali a linda existência dessa função no mundo. Um gerador não, ele te entrega um valor e fica esperando você pedir o próximo.

Por exemplo, posso ter uma função que me retorna uma lista de números `[1, 2, 3]` e depois eu vejo o que faço com eles. Um gerador me entrega o `1`, e espera eu perguntar _e aí gerador, o que vem depois?_, aí ele me entrega o `2` e assim por diante.

Mas melhor do que isso, acho, é ir para um exemplo prático: imagine uma função, que retorne todos os números inteiros entre `0` e `max_number` (ok, claro que você pode usar o `range` direto, mas… imagine apenas):

```python
def numbers_up_to(max_number):
    output = []

    for number in range(max_number + 1):
        output.append(number)

    return output
```

Escrita assim essa função cria uma lista `[0, 1, 2, 3, 4, …]` até chegar no `max_number`. Ela já cria essa lista, aloca na memória, guardando toda a lista e seu conteúdo. Ocupa espaço, usa recursos de hardware para isso. E não tem problema algum se o `max_number` for pequeno…

… mas tente usar essa função aí com um mol, ou seja, com `numbers_up_to(623 * 10 ** 21)`. Não, não tente. Teu computador vai surtar. Sério.

Para isso temos uma alternativa mais eficiente: geradores! Vamos transformar essa _função_ em um _gerador_. É simples: não criamos lista nenhuma e usamos o `yield` ao invés do `return`:

```python
def numbers_up_to(max_number):
    for number in range(max_number + 1):
        yield number
```

Agora tente usar essa função com o número gigante: `numbers_up_to_as(623 * 10 ** 21)`. Vai com fé. Dessa vez pode tentar Vai que teu computador não surta assim.

Ele só vai calcular o primeiro elemento da sequência quando precisar dele. E vai te entregar `1` e parar. Não processa mais nada, não aloca nada em memória. Nadinha. Até você pedir o próximo número. Aí ele esquece do primeiro e te entrega o segundo. E assim vai. Você vai pedindo e ele vai entregando um por vez, o terceiro, depois o quarto, depois o quinto e assim por diante. Um por vez.

Ao invés de criar a lista toda, ele cria um gerador (de listas, por exemplo, mas um iterável) e vai calculando um a um os elementos, de acordo com a necessidade de acessá-los… e de fato ele só vai calcular alguma coisa a cada `next()` – que é a função chamada internamente se você passar um gerador para um `for`, por exemplo.

Mas o `next()` também pode ser usado manualmente — o que é ótimo para explorar:

```python
my_first_generator = numbers_up_to(42)
next(my_first_generator)
next(my_first_generator)
next(my_first_generator)
next(my_first_generator)
next(my_first_generator)
```

---

Nos meus exemplos, inclusive, o `range` que é nativo do Python 3 já é um gerador em si.

Geradores são muito úteis e muito gentis com a memória. Mas como nem tudo são flores, claro, trazem algumas limitações: por exemplo, você não consegue usar dois `for` no mesmo gerador diretamente — geradores só avançam na sequência, não retornam nunca ao começo dela. Então quando o primeiro `for` esgotar o gerador, o segundo `for` não vai mais conseguir usá-lo.

Texto curto e simplista, adaptado da rápida resposta que ofereci para meu amigo. Ele disse: _Excelente explicação, agora entendi._ Então espero que ajude alguém mais além dele ; )
