---
slug: mais-uma-mudanca-acidental-na-camara-impacta-a-serenata-de-amor
tags: [pt]
title: Mais uma mudança (acidental?) na Câmara impacta a Serenata de Amor
---

Últimas semanas dessa fase da [Serenata de Amor](http://serenata.datasciencebr.com). Nós aqui muito gratas e gratos por todo o apoio que tivemos, pela força que nos deram com grana, retuítes, críticas e elogios.

Nós aqui também muito empolgados e curiosos para ouvir da Câmara dos Deputados respostas sobre as [centenas de denúncias](https://datasciencebr.com/o-resultado-do-mutir%C3%A3o-de-den%C3%BAncias-%C3%A0-c%C3%A2mara-321ef0825888) que geramos na [semana passada](https://datasciencebr.com/como-est%C3%A1-acontecendo-a-hackaton-de-den%C3%BAncias-da-opera%C3%A7%C3%A3o-serenata-de-amor-a8bd193e0c76).

E, por fim, nós aqui muito decepcionados com a Câmara dos Deputados mais uma vez — e só digo _mais uma vez_ pois recentemente [a Câmara rasgou quase R$ 2 milhões](https://datasciencebr.com/o-sistema-de-r-1-78-milh%C3%B5es-da-c%C3%A2mara-dos-deputados-630d23d79e92) de maneira que não nos agradou nem um pouco: o serviço era desnecessário, a implementação foi demasiadamente ineficiente e o valor total, um desacato.

E agora uma falha da Câmara está atrasando toda a Operação Serenata de Amor, novamente, há semanas.

## **Dados abertos, mas não acessíveis — e corrompidos**

Já falamos aqui que a forma como a Câmara segue a Lei de Acesso à Informação não é o ideal: [ter os dados disponíveis não é a mesma coisa que ter os dados acessíveis](https://datasciencebr.com/dispon%C3%ADvel-%C3%A9-diferente-de-acess%C3%ADvel-56e1f76188c1#.3khpxdycy). Mas agora é pior ainda. Há semanas os dados não estão nem disponíveis. Ou, na melhor das hipóteses, estão disponíveis mas corrompidos.

Toda a análise da Serenata de Amor começa com [os dados abertos que a Câmara disponibiliza](http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/dados-abertos-cota-parlamentar). Eles dividem os gastos com a Cota para Exercício da Atividade Parlamentar em três arquivos: um com os dados do ano atual, um com os dados do ano anterior e por fim, empacotam todos os anos _anteriores ao anterior_ em um arquivão gigante.

Só esse arquivo dos anos anteriores, quando começamos, o projeto tinha 3,5Gb. De umas semanas para cá, tudo enguiçou na [Rosie](https://github.com/datasciencebr/rosie), nosso robô que coleta e analisa os dados. Fomos averiguar e descobrimos que a Rosie não consegue mais ler esse arquivo. Olhando o arquivo foi fácil entender o porquê.

Por alguma razão que não sabemos esse arquivo está corrompido — há semanas. Hoje o arquivo acessível pelo link tem apenas 200Mb, ou seja, praticamente só 5% do que costumava ser em 2016. Por fim, o arquivo termina no meio de uma palavra. Para quem entende da parte técnica, [no meio de uma tag](https://nbviewer.jupyter.org/gist/cuducos/50df395ac13fbf7159282cb6f6c109c3) — é como se fosse uma revista sem 95% das páginas, ou como comparar um jornal de domingo inteiro com meia página que restou depois de alguém o picotar.

Já comunicamos à Câmara, protocolo número 170117–000249, mas ainda não obtivemos resposta — e coloco esse protocolo aqui só por praxe, pois o novo e caro sistema da Câmara não deixa ninguém verificar a veracidade com ele (a não ser a própria pessoa que o gerou). Também escrevemos ao [Laboratório Hacker da Câmara dos Deputados](http://labhackercd.net/).

A resposta, para ser sincero, pouco nos interessa. Queremos é que a Câmara volte a cumprir o quanto antes a Lei da Acesso à Informação disponibilizando um arquivo que, ao menos, não esteja corrompido.

### **É só mimimi?**

Essa pergunta é válida e sincera. Mas não é só de mimimi que vive esse texto. Essa falha na Câmara tem impacto direto no nosso trabalho. Poderia falar por dias sobre isso, mas vou resumir em três pontos:

#### Análise

Por melhores que tenham sido os resultados das denúncias que já fizemos, não temos como analisar os dados mais novos pois o processo está quebrado. Os dados estão disponíveis pois estão em outros arquivos (ano atual e ano anterior), mas o fato do terceiro arquivo está corrompido compromete o fluxo do sistema. Nossa análise não é 100% pois perdemos tempo adaptando o sistema para lidar com essa falha da Câmara ou, por vezes, ignorando os dados novos e focando no que tínhamos até tudo parar de funcionar.

#### Automatização

Queremos automatizar tudo: hoje o [Jarbas](http://jarbas.datasciencebr.com) é nossa ferramenta para visualizar os dados, e a Rosie a peça fundamental que pega os dados, analisa e alimenta o Jarbas. O problema é que a conversa entre Jarbas e Rosie ainda é feita manualmente: digitamos um comando para a Rosie gerar os arquivos, então pegamos esses arquivos e passamos para o Jarbas; por fim digitamos outro comando para o Jarbas ler esses arquivos.

Nosso foco nessas semanas é fazer com que tudo isso aconteça automática e periodicamente: em um servidor, uma ou duas vezes por dia, esse processo todo vai acontecer sem a necessidade de um humano digitar comandos ou mover arquivos. Isso vai fazer com que o Jarbas esteja sempre atualizado. **Sempre**. Mas não temos como testar essa implementação se a Câmara nos oferece um arquivo corrompido.

#### Futuro

Estamos encerrando um ciclo da Serenata: arrecadamos dinheiro para tocar o projeto, em período integral, por dois meses. Como arrecadamos um pouco a mais, e como estamos lançando uma [nova forma de nos apoiar](https://apoia.se/serenata), temos um fôlego para mais algumas semanas. Mas mesmo assim, os fundos são insuficientes para sustentar os membros da equipe, ou seja, o projeto como um todo. Estamos em constante contato com pessoas e instituições que podem nos ajudar a ir mais longe.

Parte importantíssima desses contatos é mostrar o que já fizemos, é mostrar números, é medir impacto. E é também arredondar as arestas do que entregamos. Como expliquei nos dois pontos anteriores, um simples arquivo corrompido atrapalha tudo isso. Por tabela, compromete nossas conversas que visam o futuro da Operação Serenata de Amor.

Seguimos firmes e fortes. Acidentes acontecem e acreditamos que tenha sido apenas um minuto de desatenção. Pode ser que isso gere desconfiança de que a Câmara está tentando nos atrapalhar, mas não é nisso que acreditamos. Apenas registramos aqui falhas que agem como areia na engrenagem — por mais que pequenas, atrapalham nosso trabalho.

Esperamos ter acesso aos dados muito em breve para poder atualizar esse artigo com boas notícias. Temos nos esforçado para fazer o que acontece dentro da Câmara ser (ainda) mais acessível para todos.

Que venha 2017 e uma Câmara melhor!

**Você pode fazer com que a Operação Serenata de Amor não chegue ao fim** [**nos ajudando aqui**](http://apoia.se/serenata)**.**

---

### **Atualizado em 24 de janeiro de 2017**

Hoje às 11h31 a Câmara respondeu:

> A partir da comunicação deste incidente constatamos que o arquivo de anos anteriores realmente apresentou problemas, possivelmente motivado por ter sido a ele acrescido o movimento de mais um ano nesta última virada de ano, o que aumentou o seu tamanho.

> Utilizamos nova metodologia para a geração do referido arquivo e agora o mesmo se encontra disponível.

Hoje a versão corrigida do XML tem dados sobre 2.404.938 reembolsos mas tem uma pequena incoerência: em alguns reembolsos existe o campo _ideDocumento_ (com a letra “d” maiúscula) e em outros, no mesmo arquivo, _idedocumento_ (tudo minúsculo). Quem é da área técnica sabe que esse pequeno detalhe pode causar problemas — por sorte, problemas fáceis de serem contornados. Nós da Serenata [já contornamos isso](https://github.com/datasciencebr/serenata-toolbox/pull/22).

Depois de quase um mês descumprindo (acidentalmente) a Lei de Acesso à Informação parece que o acesso aos dados foi reestabelecido — muito obrigado à Câmara dos Deputados e a todo mundo que compartilhou esse nosso apelo!
