---
slug: tuplas-e-listas-no-python
tags: [pt]
title: "Tuplas e listas no Python"
---

Outro dia, em um fórum de Python, alguém perguntou:

> Existe alguma diferença entre tupla e lista em relação a performance?

Como alguns de vocês talvez já saibam, eu adoro olhar para o Python com um olhar crítico de performance. Então logo respondi:

> Muita : )

E, claro, depois me expliquei. E a resposta que dei no fórum virou esse post! Vamos, lá. Na implementação baixo nível a lista tem dois gargalos:

## Lista ocupa mais espaço em memória do que precisa ocupar o conjunto de seus itens

Para podermos rapidamente inserir itens em uma lista, sem se preocupar com essa implementação baixo nível, o Python implementa um mecanismo por debaixo dos panos: ao criarmos uma lista, o Python reserva um espaço em memória maior do que seria necessário para aqueles itens dessa lista. Uma lista normalmente ocupa em memória algo próximo do dobro dos seus elementos. Quer ver na prática? Rode esse código aí:

```python
from sys import getsizeof


exemplo = []
for number in range(21):
    exemplo.append(number)
    print(getsizeof(exemplo), exemplo)
```


O resultado deve ser algo como:

```
96 [0]
96 [0, 1]
96 [0, 1, 2]
96 [0, 1, 2, 3]
128 [0, 1, 2, 3, 4]
128 [0, 1, 2, 3, 4, 5]
128 [0, 1, 2, 3, 4, 5, 6]
128 [0, 1, 2, 3, 4, 5, 6, 7]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
```

A primeira coluna mostra o espaço que a lista `exemplo` ocupa, em bytes, a cada iteração, ou seja, conforme vamos incluindo novos elementos na lista. Repare que de 1 a 4 elementos a lista ocupa 96 bytes. Depois salta para 128 bytes, e assim fica até chegar em 8 elementos. Então, outro salto: 192 bytes. E assim vai.

Isso não ocorre com a tupla. Como ela é imutável, o Python não precisa reservar espaço para novos elementos. Não acredita? Faça o teste você mesmo:

```python
for number in range(21):
    exemplo = tuple(range(number))
    print(getsizeof(exemplo), exemplo)
```

O resultado deve ser algo como:

```
56 (0,)
64 (0, 1)
72 (0, 1, 2)
80 (0, 1, 2, 3)
88 (0, 1, 2, 3, 4)
96 (0, 1, 2, 3, 4, 5)
104 (0, 1, 2, 3, 4, 5, 6)
112 (0, 1, 2, 3, 4, 5, 6, 7)
120 (0, 1, 2, 3, 4, 5, 6, 7, 8)
128 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
136 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
144 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
152 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)96
160 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
168 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
176 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
184 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
192 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17)
200 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
208 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19)
```

Essa implementação da lista no Python permite que, na maioria das vezes, a gente consiga incluir rapidamente novos elementos nessa lista, pois esse novo elemento cabe nesse espaço extra. Mas e quando não cabe mais nada nesse espaço extra? Aí entra o outro gargalo:

# Inserir (ou excluir) elementos em uma lista pode custar caro

Vimos que a lista tem um espaço extra que o Python reserva para novos elementos. Mas se você vai incluindo elementos, começa a ocupar esse espaço. Da mesma forma, se você vai excluindo elementos, esse espaço extra começa a ficar desnecessariamente grande. Por isso, ao manipular uma lista, de tempos em tempo o Python reescreve a lista toda em um local diferente, para ajustar esse espaço livre. Isso não é feito a cada `append` ou `pop`, mas quando o Python julga que esse espaço extra está desproporcional (muito grande ou muito pequeno).

E reescrever uma lista inteira em outro espaço da memória é uma operação _cara_ tecnologicamente falando. Repare nesse teste e na sua saída:

```
$ python -m timeit -s 'exemplo = [1, 2, 3]' 'exemplo.append(4)'
10000000 loops, best of 3: 0.0585 usec per loop
```

Esse comando faz o seguinte: cria uma lista `exemplo = [1, 2, 3]` e adiciona a ela um novo item (o inteiro `4`) com o `exemplo.append(4)`. Essa operação é repetida 10 milhões de vezes e a saída me diz quanto tempo leva essa operação. Quase nada: 0.05 nano(?) segundos.

Agora, ao invés de só dar um `examplo.append(4)` vamos fazer uma série de 10 `append`s. Como incluir um único elemento leva 0.05, o esperado para incluir 10 elementos, logo, seria 0.5 (10x mais), correto? Não…

```
$ python -m timeit -s 'l = [1, 2, 3]' 'for num in range(10): l.append(num)'
1000000 loops, best of 3: 0.888 usec per loop
```

Isso ocorre pois de tempos em tempos o Python vai ter reescrever a lista toda em outro lugar da memória. É o que ocorre, no primeiro exemplo, quando a lista pula de 96 para 128 bytes, depois para 192 e assim por diante. Incluir 10 itens novos nessa lista leva, na média, quase 0.09 por elemento — ou seja, aproximadamente o dobro do que para um único `append`, né?

Esse tempo não é distribuído igualmente a cada `append`… provavelmente o tempo de incluir o primeiro, o segundo e o terceiro itens é próximo ao 0.05. Mas depois disso tem um processo bem mais demorado de reescrever toda a lista, uma operação custosa. Depois dela tudo volta ao normal (ou seja, operações rápidas) até que nova reescrita seja necessária.

---

Esse gerenciamento de espaço extra nas listas do Python é genial e resolve vários problemas de baixo nível. Mas tem esse custo, ou seja: ocupa mais memória do que precisa, e de tempos e tempos, a manipulação de lista é mega cara tecnologicamente falando.

Por isso eu só uso listas quando preciso mesmo ficar manipulando (incluindo ou excluindo elementos) uma sequência. Caso contrário, normalmente a escolha é uma tupla: como a tupla não precisa se preocupar com inclusão ou exclusão de ítens, ela ocupa só o necessário em memória.
