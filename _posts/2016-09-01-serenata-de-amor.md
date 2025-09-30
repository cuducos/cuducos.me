---
layout: post
lang: pt
title: "Serenata de Amor"
---

Há alguns meses [escrevi que faço o uso de tecnologia como voz política]({% post_url 2016-05-13-autonomia-meus-ultimos-10-anos %}). Hoje sinto uma gigante satisfação de contar que sou parte da [Serenata de Amor](https://github.com/datasciencebr/serenata-de-amor).

Na Serenata de Amor nós usamos muita tecnologia para combater a corrupção. Estamos apenas começando, testando, explorando. Em breve teremos robôs passando um pente fino na chamada [verba indenizatória](http://www2.camara.leg.br/participe/fale-conosco/perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar), uma grana enorme – mais de R$ 210 milhões por ano — que nossos deputados podem utilizar sem licitação para exercer seus mandatos. E fazemos tudo com dados abertos e com código aberto.

Logo de cara esbarramos com pequenas entraves tecnológicas: por exemplo, alguns arquivos liberados pela Câmara respeitam a lei de transparência, [mas a gente não os considerava acessíveis](https://datasciencebr.com/dispon%C3%ADvel-é-diferente-de-acess%C3%ADvel-56e1f76188c1). Escrevemos e disponibilizamos [ferramentas](https://github.com/datasciencebr/serenata-de-amor/blob/master/src/xml2csv.py) que conseguem digerir e tornar o acesso a esses dados muito mais simples e leve em termos de requisitos de hardware.

Mas isso é somente o aquecimento. Explorando os dados, apenas para ter uma ideia do que era possível fazer, já achamos alguns casos interessantes. Sabia que tem deputado que paga cerveja com o dinheiro do contribuinte? E não é qualquer cerveja — é uma Samuel Adams no restaurante do Gordon Ramsey, o famoso *chef* durão do programa de TV *Hell's Kitchen*. Sabia que tem deputado provavelmente usando dinheiro da verba indenizatória para custear a própria campanha política?

Não acreditam? Ok, confesso: é uma pergunta retórica. Como dizia o grande Antônio Carlos Jobim, o Brasil não é para principiantes. Então eu não esperava mesmo nenhuma expressão de surpresa. Em todo caso, [nesse link da própria Câmara](http://www.camara.gov.br/cota-parlamentar/documentos/publ/2880/2015/5660757.pdf) qualquer um pode ver o recibo do que foi ressarcido a um deputado.

{% include figure.html class='polaroid' src='2016-09-01-serenata-de-amor-01.png' alt='What happens in Vegas stays in Vegas' %}

Eu mesmo verifiquei o [site da cervejaria](http://www.samueladams.com/) para verificar se eles, por algum acaso, não tinham uma cerveja sem álcool. Aparentemente não tem. Fui ler a lei que cria a verba indenizatória e vi que ela não proíbe explicitamente que a verba seja usada com bebidas alcoólicas. Consultei a própria Câmara e [me responderam](https://dl.dropboxusercontent.com/u/1311043/177491_157185_27490_A337103612015.pdf) que a lei não é clara mas que a jurisprudência do [TCU](https://pt.wikipedia.org/wiki/Tribunal_de_Contas_da_União) “considera tal prática incompatível com o interesse da Administração Pública” e que para a própria [CGU](https://pt.wikipedia.org/wiki/Controladoria-Geral_da_União_(Brasil)) “despesas com bebidas alcoólicas […] são consideradas inelegíveis, ou seja, não podem ser custeadas com recursos públicos, salvo em recepções oficiais” — mesmo assim o valor total do recibo foi pago ao deputado, R$ 83,45 após convertido para nossa moeda.

No outro caso que achamos intrigante um deputado aparentemente financiou a própria campanha usando a verba indenizatória, pagando uma empresa que ele mesmo criou, em seu próprio nome. Mais uma vez temos [o comprovante no site da Câmara](http://www.camara.gov.br/cota-parlamentar/documentos/publ/705/2015/5621548.pdf) com o valor integral que foi devolvido ao deputado: R$ 190,05 pagos utilizando aquele mesmo bolso, o nosso.

E esse caso tem um detalhe que vale ser ressaltado: o comprovante diz que as despesas se referem ao período da primeira quinzena de fevereiro de 2015, mas a empresa está inativa na receita Federal desde 2014. É só [entrar no site da Receita](http://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/cnpjreva_solicitacao2.asp), pesquisar pelo CNPJ `20.574.089/0001-07` e clicar em *Sim* na opção “Deseja emitir a Certidão de Baixa?” — a certidão deve ser parecida com esta:

{% include figure.html class='polaroid' src='2016-09-01-serenata-de-amor-02.png' alt='Certidão de Baixa' %}

Analisar esses casos, um a um, leva tempo. É possível e a [Operação Política Supervisionada](http://ops.net.br) faz isso com imenso sucesso: mais de R$ 5 milhões já foram contestados e ressarcidos aos cofres públicos graças a dedicação de inúmeros voluntários. O que fazemos na Serenata de Amor é expandir esse poder de análise tendo a tecnologia ao nosso lado: usamos _data science_ e _machine learning_ para analisar um banco de dados gigantesco, de anos e anos de verba indenizatória, e tudo isso de forma ágil e transparente.

{% include figure.html class='polaroid' src='2016-09-01-serenata-de-amor-03.jpg' alt='Making of, com Irio e Cabral, de um vídeo para a campanha que começamos logo logo' %}

Muitas são as possibilidades: cruzar os dados da verba indenizatória com os dados dos CNPJ onde os gastos foram feitos, com endereços e localizações, com a agenda oficial do político, com os nomes dos sócios das empresas; com data de abertura e baixa da empresa; achar dados que desviam dos padrões; colocar nome de familiares nos nossos modelos; e muito mais. Estamos apenas começando e as possibilidades e expectativas são muitas.

Esse post é uma celebração pessoal, minha, em virtude da satisfação que esse projeto me traz. Mas esse post é, também, uma pequena mostra do que podemos fazer. E, por fim, esse post é ainda [um convite](https://github.com/datasciencebr/serenata-de-amor/blob/master/CONTRIBUTING.md).

---

**Atualização (07/09/2016):** Quero levar esse projeto muito a sério. No ano em que estou me mudando de volta para o país, essa é minha serenata de amor ao Brasil. Para isso preciso da sua ajuda: eu, assim como você, pago minhas contas com meu trabalho, e a Serenata de Amor é meu trabalho agora. Esse projeto [está no Catarse](http://catarse.me/serenata): se puder, colabore por lá; se puder, divulgue o link para seus amigos e conhecidos ; ) Muito obrigado!

<blockquote class="twitter-tweet" data-lang="en"><p lang="pt" dir="ltr">Já falei do <a href="https://twitter.com/hashtag/SerenataDeAmor?src=hash">#SerenataDeAmor</a> aqui e quero levar esse projeto muito a sério. Ele é nossa serenata de amor ao Brasil <a href="https://t.co/wf993HH1l8">https://t.co/wf993HH1l8</a></p>&mdash; Cuducos (@cuducos) <a href="https://twitter.com/cuducos/status/773364126152269824">September 7, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
