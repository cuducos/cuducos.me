---
slug: refactor-facil-em-python-com-neovim
tags: [pt, Python, Neovim]
title: "Refactor fácil em Python com NeoVim (ou Vim)"
---

Uma vez ouvi um amigo, o [Henrique Bastos](https://henriquebastos.net/), falar pra alguém que usava Vim algo como:

> Quero ver fazer um refactor tão fácil como no PyCharm…

Por refactor ele queria dizer mudar o nome de um objeto (uma função, uma classe, um método) e a <acronyn title="Integrated Development Environment">IDE</acronyn> vasculhar teu projeto todo refletindo essa mudança no _namespace_.

Lembro que na hora não respondi pois… Primeiro odeio guerra de editor/IDE etc. Tenho mais o que fazer. Cada um use o que te faz mais produtivo. E segundo pois a provocação não era pra mim. Mas se alguém precisar, tem jeito facinho facinho!

Eu uso o [NeoVim](https://neovim.io/), mas a dica funciona com o Vim também: normalmente quem desenvolve em Python tem o [`python-mode`](https://github.com/python-mode/python-mode) instalado. Esse plugin instala o [`ropevim`](https://github.com/python-rope/ropevim), é esse último tem o comando `RopeRename`, que faz exatamente isso que o Henrique perguntava.

É super fácil de usar:

1. Posicione o cursor no objeto que vai renomear
1. `C-c r r` (no jargão do Vim isso é `Ctrl + c` depois `r` e depois `r` outra vez)
1. Escolha o novo nome do teu objeto
1. Pronto! Só escolher se é pra refatorar tudo mesmo (`perform`) ou só fazer um `preview` do refactor 🎉

Tão fácil quanto o PyCharm… e não lembro se o PyCharm te mostra um preview antes 😉
