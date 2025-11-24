---
slug: cartilha-de-lua-para-neovim
tags: [pt, Lua, Neovim, Dev]
title: "Cartilha de Lua para Neovim"
---

_Post de autoria de [Austin Gatlin](https://www.gatlin.io) publicado [originalmente em inglês](https://www.gatlin.io/blog/post/lua-primer-for-neovim). Tradução livre de Eduardo Cuducos._

---

Ou: O que eu gostaria de ter sabido antes de eu começar a escrever meu `init.lua` para Neovim, do zero, e sem experiência prévia com Lua.

## Introdução

Essa cartilha vai focar em Lua no contexto do Neovim. Especificamente, em escrever arquivos de configuração `init.lua` e outros códigos Lua para Neovim. Essa cartilha assume que a pessoa que está lendo já é familiarizada com programação e conceitos de programação, mas basicamente não tenha nenhum contato com Lua. Dessa forma, essa cartilha não cobre o “básico de programação”. Vamos começar!  

## Lua na sua máquina

O executável Lua tem um REPL embutido. Assumindo que ele esteja no teu _path_, simplesmente execute `lua`. Eu recomendo o [asdf](https://github.com/asdf-vm/asdf) como um gerenciador de versão genérico. Instalar via asdf vai instalar também o `luarocks` que é o gerenciador de pacotes Lua. No entanto, a experiência no REPL Lua não é a de uma _sandbox_. Por exemplo, você não pode guardar variáveis locais. Para isso, você precisa escrever um arquivo Lua e passá-lo para o executável, ou seja, `lua example.lua`. Por fim, o [Replit](https://replit.com/languages/lua) tem um REPL online em Lua.

## Variáveis

Variáveis são [globais](https://www.lua.org/pil/14.html) por padrão. Para torná-las não globais, você adiciona a palavra-chave `local`. Eu recomendo tornar toda variável local ao menos que você tenha uma razão para fazer o contrário. (Uma coisa para prestar atenção aqui é o [uso recursivo de funções locais](https://www.lua.org/pil/6.2.html). Mas, se você está escrevendo um função recursiva, leve em conta que Lua é otimizada para [recursão em cauda](https://www.lua.org/pil/6.3.html).)


```lua
a = 3
local b = 4

function uau() return 5 end
local function uau() return 5 end:
-- Equivale a
local uau; uau = function () return 5 end
-- Similar a (mas com problemas de recursão/autoreferência)
local uau = function () return 5 end
```

## Tudo é uma tabela

There is only one data type in Lua, the [table](https://www.lua.org/pil/11.html). The table is an associative array, which you might know from other programming languages as a map or dictionary. The two most common constructors for tables are the "array" constructor and the "record" constructor.
Existe apenas um tipo de dado em Lua, a tabela. A tabela é um [vetor associativo](https://pt.wikipedia.org/wiki/Vetor_associativo), que talvez você conheça de outras linguagens de programação como mapa ou dicionário. Os usos mais comuns de tabela são como _array_ ou _record_:

```lua
local array = { 'um', 'dois', 'três' }
local record = { a = 'um', b = 'dois', c = 'três' }

-- a construção de um array é um açúcar sintático para o seguinte
-- código, que é equivalente ao constructor de um “record”
local array = { [1] = 'um', [2] = 'dois', [3] = 'três' }

-- a construção de um “record” é um açúcar sintático para o seguinte
-- código, que é equivalente em múltiplas linhas
local record = {}
record.a = 'um'
record.b = 'dois'
record.c = 'três'

print(array[1]) -- => um
print(record.a) -- => um
```

Tables, as the only fundamental datatype, have a lot of versatility. Keys can be anything (it gets weird). If the key is a string it can be invoked with method-like syntax.
Tabelas são o único tipo de dado fundamental, tem muita versatilidade. Qualquer coisa pode ser uma chave (isso vai longe). Se a chave é um texto ele pode ser chamado com a sintaxe de um método:

```lua
local b = { a = 'um', [2] = 'dois', ['b'] = 'três' }
print(b.a) -- => um
print(b['a']) -- => um
print(b[2]) -- => dois
print(b['b']) -- => três
print(b.b) -- => três
```

Por fim, é bom saber que você pode “desempacotar” os valores de uma tabela diretamente em uma função com a função `unpack`.

```lua
print(unpack({1, 2, 3})) -- => 1, 2, 3

local f = function () return { 'um', 'dois' } end
local imprime_duas_coisas = function (x, y)
  print(x)
  print(y)
end

imprime_duas_coisas(unpack(f()))
-- => um
-- => dois
```

## Textos

Aspas simples e aspas duplas intercambiáveis e ambas podem ser escapadas com a `\`. `print('lua is "cool"')`, `print("lua 'rocks'")`, `print("lua is \"cool\"")`.

Textos de múltiplas linhas são feitos com sintaxe `[[ … ]]`. É prática comum isso em arquivos `init.lua` para executar múltiplas linhas de Vimscript.

```lua
vim.cmd([[
  autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  autocmd BufRead,BufNewFile *.eex,*.leex,*.sface set filetype=eelixir
  autocmd BufRead,BufNewFile mix.lock set filetype=elixir
]])
```

## Funções

A sintaxe de funções em Lua pode ser bem peculiar e, ao menos para mim, causou muita confusão quando eu comecei a ler código em Lua. Com certeza, a coisa mais confusa em toda minha escalada em Lua é o fato de que você pode omitir parênteses nas chamadas de função. Vamos dar uma olhada.

### Omitindo os parênteses

Você pode omitir parênteses em chamadas de funções em dois cenários: Quando a função aceita **um único argumento** e esse único argumento é ou (1) um texto ou (2) uma tabela. Você pode ainda adicionar um espaço se você quiser. Tudo que você está prestes a ver é uma chamada válida de função.

```lua
print({})
print{}
print {}

print('uau')
print'uau'
print 'uau'
print[[uau]]
print [[uau]]
```

Com isso em mente, fica mais fácil entender os _plugins_ para Neovim que tem exemplos de configuração como esse a seguir.

```lua
require'nome_do_plugin'.setup{
  alpha = true,
  beta = false,
  ...
}
```

Não tem nada especial, nenhum truque acontecendo. Eles estão apenas chamando a função `require` (da qual vamos falar logo mais) com um único argumento do tipo texto. Então, uma vez que que a tabela do _plugin_ é carregada, eles estão chamando a função `setup` com um único argumento do tipo tabela.

```lua
-- Exemplo de código de plugin
nome_do_plugin = {
  setup = function (config)
    if config.alpha or config.beta then
      ...
    end

    ...
  end,
  ...
}
```

### Outras curiosidades sobre funções

Funções em Lua podem receber um número variável de argumentos. Funções em Lua podem receber argumentos nomeados. E, por último, mas não menos importante, funções em Lua podem retornar múltiplos valores.

```lua
-- Exemplo retornando múltiplos valores
local f = function () return 1, 2, 3 end
local x, y, z = f()
print(x, y, z) -- => 1, 2, 3
```

## A palavra-chave require

Uma forma comum de encontrar exemplos de configuração de _plugins_ em `init.lua` é esse.

```lua
require'nome_do_plugin'.inicializar()

require'nome_do_plugin'.setup{
  ...
}
```

Agora sabemos da “cobertura de açúcar sintático” nas chamadas de função. Mas por que chamar `require` duas vezes? Bem, para ser sincero, eu não sei. Você pode criar uma variável local, se quiser. Tudo que posso dizer é que não tem prejuízo algum fazer chamadas repetidas da função `require` com textos idênticos. Se uma arquivo já foi requisitado antes, não será feita uma nova busca.

Pode ser que existam convenções que eu não conheça sobre chamadas da função `require` e sobre quando colocar ou não espaços entre chamadas de função com “açúcar sintático”. Normalmente eu diria para seguir a convenção, mas até que eu ouça argumentos de verdade sobre isso, eu vou ficar com o que eu acho esteticamente mais agradável (variáveis locais e espaços, respectivamente).

## Miscelânea 

Ponto-e-vírgula é totalmente opcional. Dentro de uma tabela, ponto-e-vírgula e vírgula são intercambiáveis. `~=` é um açúcar sintático para “não igual”. Índices começam em 1, não em 0.

## Conclusão

Espero que essa cartilha te ajude a começar e avançar mais rápido com seu `init.lua`. Afinal, configurar Vim já consome tempo demais, né? XD

Happy coding! :D
