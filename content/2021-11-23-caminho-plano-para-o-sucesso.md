---
slug: caminho-plano-para-o-sucesso
tags: [pt, Dev]
title: Caminho plano para o sucesso
---

_Post de autoria de [Felipe Ximenes](https://twitter.com/xima), publicado originalmente em inglês no blog da [Vinta](https://www.vinta.com.br/blog/2018/flat-success-path/), com revisão técnica de [Cuducos](https://twitter.com/cuducos), [Carriço](https://twitter.com/VictorCarrico) e [Anderson](https://twitter.com/AndersonRe86). Tradução livre de Eduardo Cuducos._

---

> Para pythonistas, pode ser também “por que plano é melhor que agrupado” 

Se você quer escrever programas de computador que sejam claros e fáceis de entender, garanta que eles tenham um caminho plano para o sucesso.

Um “caminho plano para o sucesso” significa muitas coisas. Primeiro, significa que cada função, método ou procedimento dever ter um único propósito. Uma das formas de identificar se você está fazendo isso corretamente é tentar dar um nome para cada bloco de código. Se você não conseguir chegar em um nome simples, isso já é um cheirinho de que pode ter coisa errada.

A segunda coisa que isso significa é que o caminho de sucesso de uma função deve estar claro nos seus comandos mais planos.

Uma note sobre o que _plano_ quer dizer: Um comando agrupado é um bloco de código que está em uma cláusula que posiciona, visualmente, o início desse código de uma forma que ele fique mais distante da margem esquerda do editor de texto (dado que você siga as boas práticas de [identação](https://pt.wikipedia.org/wiki/Indenta%C3%A7%C3%A3o)). `if`/`else` e `try`/`catch` são exemplos disso. Código plano é o oposto de código agrupado, é código que fica próximo da margem esquerda do editor. 

O caminho de sucesso pode significar coisas diferentes em partes diferentes do código: algumas vezes é o comportamento padrão de uma função, em outras, a coisa mais provável que pode acontecer, ou simplesmente o caminho que não diverge do propósito principal do código. Por exemplo, quando você escreve uma função `divide(x, y)` que recebe argumentos externos, por mais que o propósito do código seja executar `x / y`, você vai querer assegurar que `y` não é `0` antes de fazer o cálculo. Verificar o valor de entrada é fundamental para o funcionamento correto da função, mas não é o propósito principal de `divide`. Por definição, você não vai conseguir ter um caminho plano para o sucesso a não ser que exista apenas um propósito principal para a função. Uma coisa depende da outra.

Vamos ver como isso funciona na prática; aqui temos uma função que transfere dinheiro de uma pessoa para outra, retorna `true` em caso de sucesso, ou `false` se ela falhar.

```python
def transfere_dinheiro(origem, destino, quantia):
    if quantia > 0:
        if origem.saldo >= quantia:
            origem.saldo = origem.saldo - quantia
            destino.saldo = destino.saldo + quantia

            notificação_de_sucesso(origem, quantia)
            return True
        else:
            notificação_de_saldo_insuficiente(origem)
            return False
    else:
        return False
```

Isso está uma bagunça. Em uma olhada rápida, não é possível entender o que essa função faz. Isso acontece por causa de algumas coisas:

1. Blocos `if`/`else` e agrupamentos dificultam a identificação do fluxo principal, do objetivo que esse bloco de código tenta alcançar
1. Ao menos que você leia tudo e compreenda o que a função faz, não tem como saber quais são os valores retornados para casos de sucesso ou falha

Agora, vamos reescrever:

```python
def transfere_dinheiro(origem, destino, quantia):
    if quantia <= 0:
        return False

    if origem.saldo < quantia:
        notificação_de_saldo_insuficiente(origem)
        return False

    origem.saldo = origem.saldo - quantia
    destino.saldo = destino.saldo + quantia
    notify_de_sucesso(origem, quantia)
    return True
```

Repare que, apesar de ter uma aparência mais clara, o código reescrito tem exatamente a mesma [complexidade ciclomática](https://pt.wikipedia.org/wiki/Complexidade_ciclom%C3%A1tica) da versão anterior. Também vale mencionar que a medida da complexidade ciclomática é um conceito matemático preciso que pode indicar que seu código precisa ser reescrito; por outro lado, um caminho plano está relacionado à semântica do código e é, portanto, um critério subjetivo.

A mudança principal entre a primeira e a segunda versão do código é que se você ler a segunda ignorando todo código agrupado, você fica com o fluxo principal do programa:

```python
def transfere_dinheiro(origem, destino, quantia):
    origem.saldo = origem.saldo - quantia
    destino.saldo = destino.saldo + quantia
    notify_de_sucesso(origem, quantia)
    return True
```

Esse é o caminho de sucesso. Quando alguém pega um código novo para ler, é natural que a pessoa primeiro tente entender os blocos de código mais planos para, depois, inspecionar os trechos agrupados — que normalmente esperamos que sejam digressões do fluxo principal dos dados (casos especiais, ou fluxos de detecção de erros). Substituir `if`/`else` por [cláusulas de proteção](https://refactoring.com/catalog/replaceNestedConditionalWithGuardClauses.html) é, geralmente, uma das melhores formas de destacar o caminho de sucesso. Mostramos [em outro artigo](https://www.vinta.com.br/blog/2016/metaprogramming-and-django-using-decorators/) como combinar cláusulas de proteção e decoradores em alguns casos de uso interessantes.

Não conseguir determinar o caminho plano para o sucesso é um sinal que seu código está fazendo muita coisa, e talvez seja uma boa ideia quebrá-lo em múltiplas funções.
