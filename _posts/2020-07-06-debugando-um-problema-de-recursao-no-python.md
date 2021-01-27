---
layout: post
title: "Debugando um problema de recursão no Python"
---

Em um fórum que participo apareceu uma dúvida e a forma como a interação fluiu para encontrarmos a solução foi bem interessante. Então compartilho um resumo neste blog, assim, talvez ajudamos mais gente ainda!

A ideia aqui é falar sobre **perder o medo de ler as mensagens de erro e usá-las como guia para resolver problemas**, para encontrar o que está dando problema e então, ser precisa em saber o que precisa ser solucionado. Primeiro, ajudei a pessoa a ler o a mensagem de erro e relacioná-la ao código que a pessoa havia escrito. Depois, entendemos a mensagem de erro e, por fim, propusemos uma solução.

Mas começemos pelo princípio! A mensagem incial dizia:

> Estou tentando fazer uma simulação bem básica do mecanismo de prova de trabalho da _blockchain_:
>
> ```python
> from hashlib import sha256
>
>
> def mod_hash(data, nonce):
>     return sha256(str(data + str(nonce)).encode('utf-8')).hexdigest()
>
>
> def generate(data, dificult):
>     generate_with_nonce(data, dificult, 0)
>
>
> def generate_with_nonce(data, dificult, nonce):
>     hash = mod_hash(data, nonce)
>     if hash[:len(dificult)] == dificult:
>         print(hash, nonce)
>     else:
>         generate_with_nonce(data, dificult, nonce + 1)
>
>
> generate('t1, t2, t3, t4', '00')
> ```
>
> E estou tendo um erro:
>
> ```
> RecursionError: maximum recursion depth exceeded while getting the str of an object
> ```

## Encontrando o problema

A primeira coisa que notei é que a falta do _traceback_ completo não ajudava a gente a ajudar a pessoa que tinha dúvida.

O _traceback_ é o histórico do erro, da chamada do código que a gente escreveu, passando por toda estrutura da aplicação, biblioteca de terceiros ou código fonte do Python, até chegar na linha que gera o erro. Como diz o [Henrique Bastos](https://henriquebastos.net):

> Quando um comando dá errado ou o resultado não é o esperado, é muito importante publicar a entrada e a saída na íntegra.
> 
> _Printar_ a tela geralmente oculta informações importantes. Por isso é importante que você selecione no terminal, copie e cole as linhas na íntegra desde o comando até o final da mensagem de erro.

Pedi então ao amigo que estava com a dúvida, o _traceback_ todo e a coisa ficou melhor:

> ```
> Traceback (most recent call last):
> File "…/blockchain/poow.py", line 37, in <module>
>   generate('t1, t2, t3, t4', '00')
> File "…/blockchain/poow.py", line 14, in generate
>   generate_with_nonce(data, dificult, 0)
> File "…/blockchain/poow.py", line 22, in generate_with_nonce
>   generate_with_nonce(data, dificult, nonce + 1)
> File "…/blockchain/poow.py", line 22, in generate_with_nonce
>   generate_with_nonce(data, dificult, nonce + 1)
> File "…/blockchain/poow.py", line 22, in generate_with_nonce
>   generate_with_nonce(data, dificult, nonce + 1)
> [Previous line repeated 991 more times]
> File "…/blockchain/poow.py", line 18, in generate_with_nonce
>   hash = mod_hash(data, nonce)
> File "…/blockchain/poow.py", line 10, in mod_hash
>   return sha256(str(data + str(nonce)).encode('utf-8')).hexdigest()
> RecursionError: maximum recursion depth exceeded while getting the str of an object
> ```

Lendo esse trecho ficou claro o _trajeto_ na execução do código, começando pela linha 37 — `generate('t1, t2, t3, t4', '00')`:

```
File "…/blockchain/poow.py", line 37, in <module>
  generate('t1, t2, t3, t4', '00')
```

Essa chamada da função `generate` leva a execução ao ponto onde a função `generate` é definida, e a execução prossegue dali até a linha 14 — `generate_with_nonce(data, dificult, 0)`, com uma chamada de outra função:

```
File "…/blockchain/poow.py", line 14, in generate
generate_with_nonce(data, dificult, 0)
```

E assim por diante até a última linha do código executada que a pessoa havia escrito, a linha 10:


```
File "…/blockchain/poow.py", line 10, in mod_hash
  return sha256(str(data + str(nonce)).encode('utf-8')).hexdigest()
RecursionError: maximum recursion depth exceeded while getting the str of an object
```

Em outras palavras, agora eu sabia precisamenete qual parte do código causava o erro:

```python
sha256(str(data + str(nonce)).encode('utf-8')).hexdigest()
```

O problema aí foi que essa linha fazia muita coisa:

1. Tem uma conversão para string em `str(nonce)`
1. Tem um concatenação de string com data `+`
1. Tem uma conversão para bytes com o `.encode(…)`
1. Tem a criação de um _hash_ com o `sha256(…)`
1. Tem um cálculo de hexadecimal com `.hexdigest()`

Alguns desses passos podem ter ainda conversões de objetos para _string_ por debaixo dos panos. Então fica difícil saber o que exatamente está causando o erro. Eu sugeri tentar isolar esses passos para identificar qual passo dá problema, e aí sim pensar em uma solução mais precisa. Sugeri esse _refactor_ para essa linha:

```python
def mod_hash(data, nonce):
    if not isinstance(nonce, str):
        nonce = str(nonce)

    value = data + nonce
    value = str(value)
    value = value.encode('utf-8')

    hash = sha256(value)
    return  hash.hexdigest()
```

Bingo. Executando com essa nova versão e usando a mesma estratégia, descobrimos que o `RecursionError` estava exatamente em `nonce = str(nonce)`. Excelente!

## Entendendo o erro

Como a pessoa bem resumiu, o `RecursionError` é o que acontece no Python quando uma função recursivamente chama outra várias vezes – milhares de vezes, fazendo o computador achar que está em um _loop_ infinito. Por segurança, então, ele pára esse ciclo com esse tipo de erro.

Analisando o código vi que a cada chamada da `generate_with_nonce`, o valor de `data` era passado para `mod_hash` — e `generate_with_nonce` é uma função recursiva, ou seja, ela _se chama_ diversas vezes. No entanto reparei também que o valor de `data` não mudava a cada chamada recursiva, era sempre o mesmo que a primeira chamada, a que desencadeia a exexecução recursiva. Em outras palavras, poderíamos executar o `nonce = str(nonce)` apenas uma vez, na primeira execução da `generate_with_nonce`, e apenas se `nonce` ainda não fosse _bytes_.

## Solução proposta

Com base nessa análise, sugeri o seguinte _refactor_:

```python
from hashlib import sha256


def mod_hash(data, nonce):
    values = (data, bytes(nonce))
    return sha256(b''.join(values)).hexdigest()


def generate(data, difficult, nonce=0):
    if not isinstance(data, bytes):  # avoid converting data in recursive calls
        data = data.encode('utf-8')

    hashed_value = mod_hash(data, nonce)
    while not hashed_value.startswith(difficult):
        nonce += 1
        hashed_value = mod_hash(data, nonce)

    print(hashed_value, nonce)


generate('t1, t2, t3', '000000')
```


Assim, problema resolvido, com um pouco de reflexão lendo o fluxo de execução, o famoso _traceback_ : )

