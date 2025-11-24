---
slug: nao-compartilha-captura-de-tela-para-pedir-ajuda
tags: [pt]
title: Não compartilhe captura de tela do terminal para pedir ajuda
---

Eu tenho alguns projetos de código aberto que são <abbr title="Command-line interface">CLI</abbr>, programas de linha de comando — o mais conhecido é o [Minha Receita](https://github.com/cuducos/minha-receita). E também participo (menos do que antes, mas ainda assim participo) de algumas comunidades de suporte a pessoas iniciando em programação, em alguma linguagem específicas, ou na área de dados abertos. Ambas são ocasiões onde é corriqueiro eu encontrar com pessoas pedindo ajuda.

E, o que eu quero dizer é: compartilhar captura de tela do terminal para pedir ajuda _não ajuda a gente a te ajudar_.

## Por que não compartilhar uma captura de tela do terminal?

Existem vários motivos, mas vou separar em três grupos: completude, reprodutibilidade e buscabilidade.

### Completude

Muitas vezes, a saída do terminal contém mais do que cabe na tela. Por exemplo, pode ser que o comando que você digitou já saiu do histórico, ou você usou a rolagem para ler algo no meio ou no início da saída e a captura de tela omitiu o final da saída. Isso limita quem pode te ajudar, pois essa pessoa não vai ter acesso a todas essas informações que não couberam na tela.

Ah, mas a saída é muito longa, pode indagar alguém. Ótimo. Essa informação é justamente o que pode ajudar as pessoas a te ajudar! Se você estiver abrindo uma _issue_ no GitHub, pode, por exemplo, [omitir blocos de texto](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/organizing-information-with-collapsed-sections) com `<details>` e `</details>` se não quiser poluir demais a postagem. Ou pode simplesmente usar um serviço como o [Gist](https://gist.github.com) e compartilhar a saída completa com uma URL para lá.

O ponto é, compartilhe tudo: da linha de comando digitada, até o final da saída. Isso tudo nos ajuda a te ajudar!

### Reprodutibilidade

Muitas vezes as informações da sua tela me ajudam a reproduzir o seu cenário: uma URL específica, um nome de erro, um caminho de arquivo com um número de linha. Se eu posso ler essas informações em uma imagem mas não posso selecionar esse texto, copiar e colar no meu ambiente para testar, para tentar reproduzir a situação pela qual você está passando, você não está me ajudando a te ajudar.

Um erro que eu nunca vi, eu posso querer copiar e colar para procurar na internet ou no código fonte, por exemplo. Uma parte do erro com um caminho longo de um arquivo, mais o número de linha, pode me ajudar a abrir o editor de código exatamente naquele arquivo e naquela linha. Uma URL longa, com chaves e identificadores alfanuméricos pode ser importante para eu tentar acessar e ver se obtenho o mesmo erro.

E, copiar tudo isso manualmente é muito propenso a erros. Se a pessoa que tenta te ajudar errar um caracter, pode ter outro erro, ou erro nenhum. Permitir que as pessoas copiem e colem ajuda elas a te ajudar!

### Buscabilidade

A tua dúvida pode ser a dúvida de mais pessoas: no presente, no passado ou mesmo no futuro. E nossos mecanismos de buscas (ainda) são muito melhores para texto do que para imagem. Então, compartilhar a como texto ajuda muito a a ajudar outras pessoas! Se alguém tiver, por exemplo, o mesmo erro que você, pode (mais) facilmente encontrar tua postagem num fórum, no GitHub, num chat se ela for em formato texto ao invés de imagem.

## Resumindo

Vai pedir ajuda sobre algo que acontece no terminal?

1. Selecione tudo, do comando digitado até a última linha da saída.
2. Cole em alguma plataforma de compartilhamento de texto.
3. Se disponível, use formatação com fonte monoespaçada, como os [blocos de código do Markdown](https://spec.commonmark.org/0.31.2/#fenced-code-blocks) com ```.
4. Compartilhe 💜
