---
layout: blog
title: "Como cidadãos empoderados podem conversar com deputados?"
---

_Post originalmente [publicado na Data Science Brigade](http://datasciencebr.com/como-cidadãos-empoderados-podem-conversar-com-deputados-a24ad4020f1b)._

* * *

Nós da [Operação Serenata de Amor](http://serenatadeamor.org) somos muito cuidadosos com o nosso projeto. Entendemos que ele pode incomodar alguns parlamentares mas estamos exercendo [nosso papel de cidadãos](http://datasciencebr.com/serenata-de-amor-e-transpar%C3%AAncia-nos-gastos-p%C3%BAblicos-f964bada722) e respeitando ao máximo nossos políticos. Assumimos a inocência de todos e não divulgamos nenhum nome de parlamentar até que nossas suspeitas virem denúncias, e até que tenhamos respostas oficiais a essas denúncias.

Na prática isso funciona assim:

*   Com base na [lei](http://www2.camara.leg.br/participe/fale-conosco/perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar), **criamos uma hipótese** de como a [Cota para Exercício da Atividade Parlamentar](http://www.camara.gov.br/cota-parlamentar/) pode ser usada de maneira irregular ou ilegal;
*   [Escrevemos essa hipótese em forma de código](http://datasciencebr.com/como-a-rosie-usa-machine-learning-na-serenata-de-amor-9168e0f1909d), para que nossa inteligência artificial busque nos mais de 2,5 milhões de reembolsos quais casos batem com a hipótese, ou seja, **quais são os reembolsos suspeitos**;
*   [Auditamos manualmente](http://datasciencebr.com/como-est%C3%A1-acontecendo-a-hackaton-de-den%C3%BAncias-da-opera%C3%A7%C3%A3o-serenata-de-amor-a8bd193e0c76) os reembolsos suspeitos e caso **nós, humanos, corroboremos a suspeita**, denunciamos o caso à Câmara dos Deputados;
*   Quando a Câmara nos responde (pela [Lei de Acesso à Informação](http://www.acessoainformacao.gov.br/assuntos/conheca-seu-direito/a-lei-de-acesso-a-informacao) isso leva até 10 dias), **aí sim temos um documento oficial** que nos ampara para divulgar nomes de deputados.

Foi o que aconteceu com o [Deputado Fábio Mitidieri](http://www.camara.leg.br/internet/deputado/Dep_Detalhe.asp?id=5830569). Infelizmente, ao contrário de outras tantas denúncias, a resposta que obtivemos dele não foi [um pedido de desculpas e a devolução do dinheiro](https://www.facebook.com/operacaoSerenataDeAmor/posts/602682196590773). A resposta que ele nos ofereceu apresentou argumentos que vamos questionar nesse texto — não só pelo caso específico, mas principalmente pois **muitos outros parlamentares estão nos dando respostas semelhantes**.

Vamos compartilhar aqui essa situação para que fique mais fácil para vocês que acompanham o projeto entenderem os próximos desafios da Operação Serenata de Amor.

## A suspeita

A [Rosie](http://github.com/datasciencebr/rosie) nos disse que [essa refeição](http://www.camara.gov.br/cota-parlamentar/documento?nuDeputadoId=3001&numMes=3&numAno=2015&despesa=13&idDocumento=6234) era suspeita: R$ 217,47 no [Da Noi, em Brasília](http://www.duducamargo.com.br/restaurante/danoi.html). Para ela **esse valor é suspeito pois é muito mais alto do que a média** de outras refeições que os deputados fizeram nesse mesmo estabelecimento (para quem gosta de estatística, o preço da refeição do deputado foi [maior que a média acrescida de 3 vezes o desvio padrão](https://github.com/datasciencebr/rosie/blob/master/rosie/meal_price_outlier_classifier.py#L48)).

## A pesquisa

Fizemos nossa pesquisa para confirmar se a Rosie estava certa. E, sim, estava. O [Da Noi tem um site, **com cardápio e preços online**](http://www.duducamargo.com.br/restaurante/danoi.html):

{% include figure.html src='2017-02-08-como-cidadaos-empoderados-podem-conversar-com-deputados-01.png' alt='Fonte: http://www.duducamargo.com.br/restaurante/danoi.html' %}

Os pratos mais caros custam pouco mais que R$ 50\. O deputado teria que ter almoçado **quatro pratos** para justificar uma conta que ultrapassa R$ 200\. Não podemos confirmar se foi esse o caso pois a nota fiscal diz apenas _despesa com refeição_:

{% include figure.html src='2017-02-08-como-cidadaos-empoderados-podem-conversar-com-deputados-02.png' alt='Fonte: http://www.camara.gov.br/cota-parlamentar/documentos/publ/3001/2015/5622917.pdf' %}

Além disso [usuários dizem](https://foursquare.com/v/da-noi/4d37060d036c548163444989) que uma salada com frango custou R$ 20, no mesmo restaurante, dois anos antes. [No blog do chef do restaurante](http://duducamargo.com.br/blog/final-de-semana-gastronomico-no-da-noi/) vimos que em eventos especiais, já em 2015, o preço era R$ 75 por pessoa. Mesmo sem ter detalhes do que foi consumido nessa refeição, podemos dizer que Rosie estava certa: **esse reembolso parece mesmo suspeito**.

## A denúncia

Escrevemos à Câmara pedindo esclarecimentos sobre esse reembolso. Linkamos o site do restaurante (no qual consta o cardápio com preços). O prato mais barato seria uma massa de R$ 23,30\. Os mais caros, salmão ou filé de pescada, custando R$ 51,20 cada. Acrescentando uma bebida, talvez uma entrada ou uma sobremesa, **dissemos à Câmara que o gasto médio deveria estar em torno de R$ 80** — montante muito distante do valor apresentado na nota fiscal em questão.

## A resposta

A chefe de gabinete do deputado declarou que nada disso é válido. Segundo ela não é possível calcular um valor médio para o restaurante em questão pois ele funciona com menu _à la carte_. Explica ela que “_o preço cobrado é pelo valor de cada prato ou produto solicitado, de modo que_ **_não há um valor médio observado por pessoa_**”. Com esse argumento o deputado se negou a devolver o dinheiro, mesmo que segundo a nossa lógica esse montante não seja compatível com o valor de uma refeição naquele estabelecimento.

{% include figure.html src='2017-02-08-como-cidadaos-empoderados-podem-conversar-com-deputados-03.png' alt='Fonte: Resposta oficial do deputado, via Câmara Federal, Processo nº 100.548/2017, folha 8 (grifo nosso)' %}

## A hipotética réplica

Aparentemente houve um equívoco por parte do deputado e sua equipe. Justamente o entendimento sobre o que é uma _média_. Matematicamente falando. Média é um conceito empregado exatamente para descrever como é a distribuição de valores diferentes entre si — nas palavras da Wikipédia, a média é “[o valor que mostra para onde se concentram os dados de uma distribuição](https://pt.wikipedia.org/wiki/M%C3%A9dia)”. Ou seja, se temos vários preços diferentes, **como por exemplo em um cardápio de um restaurante _à la carte_**, a média deles descreve um pouco de quão caro ou barato é esse restaurante.

No caso do Da Noi, o cardápio apresenta 14 pratos na parte de _Carnes, Aves & Peixes_ (os mais caros da casa). Os preços desses 14 pratos variam entre R$ 35,30 e R$ 51,20\. Somando todos os preços deles e dividindo pelo total de pratos, temos a média dos preços dos pratos: R$ 45,94\. Fazendo o mesmo com bebidas (são 10 não-alcoólicas, variando entre R$ 4 e R$ 27), temos a média do preço de bebidas: R$ 8,71.

Portanto, é possível obter uma média de preços por pessoa em restaurantes _à la carte_. As médias de um prato e uma bebida, somadas, totalizam R$ 55 — quase **quatro vezes menos do que o deputado alega ter consumido** em sua refeição.

{% include figure.html src='2017-02-08-como-cidadaos-empoderados-podem-conversar-com-deputados-04.png' alt='Fonte: http://www.duducamargo.com.br/restaurante/danoi.html' %}

Caso ele tivesse comido o prato mais caro, e tomado a bebida mais cara (uma jarra de suco), acrescidos os 10%, ele teria gasto R$ 86 — em outras palavras, o valor pelo qual ele foi reembolsado é **2,5 vezes maior** do que isso.

Outra forma de obter uma média de gastos no Da Noi é olhando para a própria Cota que estamos investigando: [existem 1223 reembolsos feitos a deputados que fizeram refeições nesse estabelecimento](https://jarbas.serenatadeamor.org/#/cnpjCpf/16955896000445). O mais baixo desses é no valor de R$ 2,50 — possivelmente um café ou uma água. Filtrando apenas os gastos maiores que R$ 25 (valor próximo ao prato mais barato da casa), temos 830 reembolsos. A média entre eles é R$ 59,14 — **quase 4 vezes menos do que o gasto do deputado** em questão.

Sendo assim, apesar da resposta oficial, continuamos desconfiando desse reembolso.

* * *

Infelizmente o caso do deputado Fábio Mitidieri não é o único. Muitas respostas com esse tom estão chegando na nossa caixa postal. Nosso ponto não é responder diretamente ao deputado — por isso intitulamos o trecho anterior de _réplica hipotética_.

O ponto aqui é outro: **talvez alguns políticos não tenham percebidos a verdadeira força que os cidadãos têm** com ferramentas para lidar com o grande volume de dados que a Lei de Acesso à Informação tornou público. A Serenata de Amor é um movimento nesse sentido. Sabemos responder ao deputado Fábio Mitidieri com dados que essa lei nos oferece. Sabemos responder a esses argumentos também com dados disponíveis pública e legalmente na internet.

Nosso próximo passo é descobrir a qual instância recorrer quando os próprios deputados negam os números, os dados públicos e a matemática. Além disso você pode [fazer com que a Operação Serenata de Amor continue à todo vapor](http://apoia.se/serenata). Continue [seguindo](https://www.facebook.com/operacaoSerenataDeAmor/) a gente!
