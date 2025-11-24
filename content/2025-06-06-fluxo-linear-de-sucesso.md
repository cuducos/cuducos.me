---
slug: fluxo-linear-de-sucesso
tags: [pt]
title: "Fluxo linear de sucesso: escrevendo código limpo em Python"
---

_Post de autoria de [Filipe Ximenes](https://bolha.us/@xima) originalmente [publicado em inglês no blog da Vinta](https://www.vintasoftware.com/blog/flat-success-path). Tradução livre para o português por Eduardo Cuducos._

* * *

> Para _pythonistas_ isso também poderia ser “por que linear é melhor do que aninhado”

Todo código limpo e fácil de manter normalmente segue um princípio simples: toda etapa deve ter um fluxo de sucesso claro. Esse conceito é fundamental mas muitas vezes desprezado no desenvolvimento. 

Um fluxo de sucesso claro envolve duas ideais fundamentais: Primeiro, cada função deve servir única e exclusivamente a um propósito. Pense como se você fosse perguntar como chegar a algum lugar — se você não consegue explicar para onde você está indo em uma frase simples, provavelmente você está tentando visitar mais de um lugar de uma vez só. Quando você tem dificuldade para dar um nome conciso a uma função, provavelmente isso é um sinal de que essa função está fazendo coisa demais.

Segundo, o fluxo de sucesso — a sequência de passos quando tudo ocorre como esperado — deve ser óbvio de forma imediata quando além lê o código. Isso quer dizer que a lógica deve ser mantida de forma limpa e organizada, deixando o tratamento de erros e casos extremos para escanteio. O fluxo primário da função deve ser lido como uma história na qual cada linha naturalmente leva à próxima. 

## Vamos falar sobre como manter o código linear

> Um comando aninhado é um bloco de código que está debaixo de uma cláusula que move, visualmente, o início do código para longe da margem esquerda do editor de texto (considerando que você está utilizando as boas práticas de [indentação](https://pt.wikipedia.org/wiki/Indenta%C3%A7%C3%A3o)). `if`/`else` e `try`/`catch` são exemplos disso. Um código linear é o oposto de código aninhado, é um código que está mais próximo da margem esquerda do editor.

O que é um fluxo de sucesso varia em diversas parte do código. Pode ser o comportamento padrão de uma função, o retorno mais provável, ou simplesmente o caminho que dá conta do propósito principal daquele código. Considere um função `dividir(x, y)` que recebe os valores de quem a utiliza. Por mais que executar `x / y` seja o propósito dessa função, ela tem que verificar se `y` não é `0` antes de efetuar o cálculo. Validação dos argumentos recebidos é essencial para que a função funcione corretamente, mas, ainda assim, esse não é o propósito principal de `dividir`. O destaque aqui é essa relação importantíssima: um fluxo verdadeiramente linear só é possível se a função tem um único propósito.

Para exemplificar esse conceito, vamos examinar uma função que cuida da transferência de dinheiro entre correntistas, retornando `True` para transferências efetuadas com sucesso, e `False` para os outros casos.

```python
def transferir_dinheiro(remetente, destinatário, quantia):
    if quantia > 0:
        if remetente.saldo >= quantia:
            rementente.saldo = rementente.saldo - quantia
            destinatário.saldo = destinatário.saldo + quantia
            notificar_sucesso(remetente, quantia)
            return True
        else:
            notificar_saldo_insuficiente(remetente)
            return False
    else:
        return False
```

Esse código é difícil de compreender em uma olhada rápida. Duas coisas fazem ser difícil de acompanhar o que acontece:

1. O `if`/`else` aninhado ofusca o propósito principal da função — não fica claro qual o fluxo que representa a abstração principal desse código
2. O valores a serem retornados `True`/`False` ficam espalhados pelo códigos, fazendo com que seja difícil de identificar as condições que fazem a função falhar ou ter sucesso sem que a pessoa tenha que ler todo o código

## Vamos refatorar para tornar esse código mais claro

```python
def transferir_dinheiro(remetente, destinatário, quantia):
    if quantia <= 0:
        return False

    if remetente.saldo < quantia:
        notificar_saldo_insuficiente(remetente)
        return False

    rementente.saldo = rementente.saldo - quantia
    destinatário.saldo = destinatário.saldo + quantia
    notificar_sucesso(remetente, quantia)
    return True
```

Repare que apesar de ser mais explícito, o código refatorado tem a mesma [complexidade ciclomática](https://pt.wikipedia.org/wiki/Complexidade_ciclom%C3%A1tica) que antes. Vale notar ainda que a complexidade ciclomática é um conceito matemático preciso que pode indicar que o código precisa ser refatorado. Já a linearidade tem a ver com a semântica do código e é um quesito muito mais subjetivo.

A principal mudança da primeira versão para a versão refatorada é que ignorando todo o código aninhado, a leitura evidencia o fluxo principal do programa:

```python
def transferir_dinheiro(remetente, destinatário, quantia):
    rementente.saldo = rementente.saldo - quantia
    destinatário.saldo = destinatário.saldo + quantia
    notificar_sucesso(remetente, quantia)
    return True
```

Isso é o que representa o fluxo linear de sucesso — a funcionalidade principal da nossa função de transferência. Quando se lê um código com o qual não se tem familiaridade, 
quem desenvolve normalmente foca, primeiro, nos blocos de código que não estão aninhados, que devem representar o fluxo principal. Os blocos aninhados normalmente lidam com casos especiais e condições de exceção.

Utilizar cláusulas de guarda ao invés de blocos de `if`/`else` é uma das formas mais efetivas de destacar o fluxo de sucesso. Quando você sentir que não consegue chegar nesse nível de linearidade, isso pode ser um sinal de que o código está lidando com muito mais responsabilidades do que ele deveria, e talvez deva ser separado em mais de uma função.
