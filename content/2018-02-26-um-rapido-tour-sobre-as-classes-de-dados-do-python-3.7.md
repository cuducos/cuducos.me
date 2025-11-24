---
slug: um-rapido-tour-sobre-as-classes-de-dados-do-python-3.7
tags: [pt, Python, Dev]
title: Um rápido tour sobre as classes de dados do Python 3.7
---

---

_Tradução do post de autoria de [Anthony Shaw](https://twitter.com/anthonypjshaw), [publicado originalmente no Hacker Noon](https://hackernoon.com/a-brief-tour-of-python-3-7-data-classes-22ee5e046517). Muito obrigado a eles (e especialmente ao [David Smooke](https://twitter.com/davidsmooke)) por autorizar a tradução. Obrigado também ao [Guido Percú](https://guidopercu.com.br) pela revisão da tradução._

---

Uma nova funcionalidade do Python 3.7 são as “classes de dados“ (em inglês, _data classes_). Classes de dados são uma forma de automatizar a geração de código para classes que guardam múltiplas propriedades.

Elas tem ainda a vantagem de utilizar as anotações de tipos do Python 3:

```python
from dataclasses import dataclass

@dataclass
class SimpleBaseObject(object):
    field_0: str = 'default'
```

Classes de dados vem no novo módulo padrão do Python 3.7, `dataclasses`, e tem duas coisas importantes que você vai precisar saber.

1. O decorador `dataclass`, para decorar uma classe de dados
1. O método `field`, para configurar campos

## Padrões dos métodos mágicos

Por padrão qualquer classe de dados vai implementar `__init__`, `__repr__`, `__str__` e `__eq__` para você.

O método `__init__` vai ter **argumentos nomeados** com as mesmas assinaturas de tipo da classe.

O método `__eq__` vai comparar os atributos em ordem.

Todos os campos são declarados no topo da classe e as anotações de tipo são **obrigatórias**.

```python
from dataclasses import dataclass

@dataclass
class SimpleDataObject(object):
    '''
    Nesse caso,   __init__, __repr__, __eq__,  são gerados automaticamente.
    '''
    
    field_a: int
    field_b: str

example = SimpleDataObject(1, 'b')
print(example)  # SimpleDataObject(field_a=1, field_b='b')

example2 = SimpleDataObject(1, 'b')
print(example == example2) # True
```

Esse método `__init__` vai ter uma assinatura `(field_a: int, field_b: str) -> None`. Você pode conferir isso digitando `print(inspect.signature(example.__init__))`.

## Indução de tipo

É importante destacar que as anotações de tipo são apenas dicas. Ou seja, passando tipos diferentes não faz o programa dar erro ou tentar convertê-lo.

Como a declaração dos tipos é **obrigatória** (caso contrário o campo é ignorado), se você não quiser especificar um tipo, use o tipo `Any` do módulo `typing`.

```python
from dataclasses import dataclass


@dataclass
class SimpleDataObject(object):
    '''
    Nesse caso, __init__, __repr__, __eq__,  são gerados automaticamente.
    '''
    
    field_a: int
    field_b: str

example = SimpleDataObject('a', 'b')
print(example) # Retorna SimpleDataObject(field_a='a', field_b='b')
```

## Mutabilidade

O decorador da classe de dados tem o argumento `frozen`, que é `False` por padrão. Se especificado, os campos serão “_congelados_”, ou seja, serão apenas para leitura e se `eq` for `True`, que é o padrão, então o método mágico `__hash__` será implementado e as instâncias do objeto vão ser _hashable_, assim você pode usá-las como chaves de dicionários ou em um `set`.

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class ImmutableSimpleDataObject(object):
    '''
    Nesse caso, __init__, __repr__, __eq__,  são gerados automaticamente.
    '''
  
    field_a: int
    field_b: str

example = {ImmutableSimpleDataObject(1, 'b'), ImmutableSimpleDataObject(2, 'c')}
print(example)

# Retorna : {ImmutableSimpleDataObject(field_a=1, field_b='b'), ImmutableSimpleDataObject(field_a=2, field_b='c')}
```

## Campos personalizados

O tipo principal em uma classe de dados é o tipo `Field`, que pertence ao módulo `dataclass`.

Por padrão, apenas criando um atributo da classe já instanciará um `Field` como demonstrado nos exemplos anteriores.

Se você precisa de um comportamento personalizado, você pode usar a fábrica de campos do módulo `dataclasses`.

Os parâmetros para `field()` são:

* `default`: Se fornecido, esse será o valor padrão para esse campo. Isso é necessário pois a chamada do próprio `field` substitui o valor padrão de um argumento posicional.
* `default_factory`: Um objeto que pode ser chamado sem argumentos que será chamado quando um valor padrão for necessário para esse campo.
* `init`: Incluído como um parâmetro para o método `__init__`.
* `repr`: Incluído na _string_ retornada pelo método `__repr__`.
* `compare`: Incluído nos métodos de equidade e comparação (`__eq__`, `__gt__`, etc.).
* `hash`: Incluído no método `__hash__`.

_Tem ainda um outro argumento, `metadata` que não está em uso por enquanto._

De forma similar aos argumentos nomeados, campos com valores padrão devem ser declarados por último.

Demonstrando a fábrica com valor padrão:

```python
from dataclasses import dataclass, field
import sys


def get_argv():
    return sys.argv[1]


@dataclass
class SimpleDataObject(object):
    field_a: str
    field_b: str = field(default_factory=get_argv)

example = SimpleDataObject(field_a = 'a')
print(example) # python3.7 dataclass_4.py test, retorna: SimpleDataObject(field_a='a', field_b='test')
```

## Processamento pós-init

Você pode declarar um método `__post_init__` que será executado após o `__init__` gerado automaticamente.

## Herança

Herança acontece normalmente. Você precisa utilizar `dataclass` para a classe que herda **e** para a classe que serve como base.

```python
@dataclass
class SimpleBaseObject(object):
    field_0: str

@dataclass
class SimpleDataObject(SimpleBaseObject):
    field_a: str
    field_b: str
```

No entanto, como você não pode declarar um campo sem valor padrão depois de declarar um campo que tem um valor padrão, você não pode misturar campos com e sem valor padro nas classe base e nas que herdam dela.

```python
@dataclass
class SimpleBaseObject(object):
    field_0: str = 'default'
    field_b: str = 'original'

@dataclass
class SimpleDataObject(SimpleBaseObject):
    field_a: str
    field_b: str = 'new default'
```

Esse exemplo quebra com `TypeError: non-default argument ‘field_a’ follows default argument`.

Isso é bem irritante e provavelmente vai fazer com que as pessoas não usem muito herança ou campos com valores padrão.

De toda forma, essa é uma ótima funcionalidade e eu provavelmente vou parar de usar `attr`s quando Python 3.7 for lançado.
