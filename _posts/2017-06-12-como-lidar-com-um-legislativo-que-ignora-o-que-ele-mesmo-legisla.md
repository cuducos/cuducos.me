---
layout: post
lang: pt
title: "Como lidar com um legislativo que ignora o que ele mesmo legisla?"
---

_Post originalmente [publicado na Data Science Brigade](https://medium.com/data-science-brigade/como-lidar-com-um-legislativo-que-ignora-o-que-ele-mesmo-legisla-718146d58399)._

* * *

Muitos de vocês tem acompanhado o esforço da [Operação Serenata de Amor](https://serenatadeamor.org/) para aumentar nosso poder de controle social sobre os gastos públicos. Somos transparentes, usamos os dados que a [Lei de Acesso à Informação](http://www.acessoainformacao.gov.br/) oferece e ainda fazemos [tudo com código aberto](https://github.com/datasciencebr/). Mas esbarramos em algo inesperado: deputados que desconhecem as leis. As próprias leis que eles escrevem, discutem, votam e aprovam. Vivemos em um país onde o legislativo fala com o eleitor esbanjando descaso ou desconhecimento da lei.

Se essa afirmação parece absurda, vamos aos fatos. Não quero fazer tempestade em copo d’água com o Dep. Roberto de Lucena, mas [essa resposta que ele ofereceu ao Gustavo Miranda](https://www.facebook.com/operacaoSerenataDeAmor/posts/666492223543103?comment_id=666582296867429&comment_tracking=%7B%22tn%22%3A%22R0%22%7D), a um de nossos colaboradores, é um exemplo claríssimo dessa situação:

{% include figure.html src='2017-06-12-como-lidar-com-um-legislativo-que-ignora-o-que-ele-mesmo-legisla-01.jpg' alt='Conversa do deputado com nosso colaborador' %}

O colaborador questionava sobre [um reembolso](http://www.camara.gov.br/cota-parlamentar/documento?nuDeputadoId=2282&numMes=10&numAno=2016&despesa=13&cnpjFornecedor=33469172000672&idDocumento=223528) feito pela [Cota para Exercício da Atividade Parlamentar](http://www.camara.gov.br/cota-parlamentar/) (CEAP) em nome do deputado. No Jarbas mostramos [esse reembolso assim.](http://jarbas.serenatadeamor.org/#/documentId/6122679) E a própria Câmara disponibiliza [o cupom fiscal](http://www.camara.gov.br/cota-parlamentar/documentos/publ/2282/2016/6122679.pdf) referente a essa despesa:

{% include figure.html class='polaroid' src='2017-06-12-como-lidar-com-um-legislativo-que-ignora-o-que-ele-mesmo-legisla-02.png' alt='Cupom fiscal de refeição pela qual o deputado pediu reembolso'%}

O deputado consumiu em uma refeição três pratos: um medalhão mais dois salmões. Ainda pediu um acompanhamento extra e quatro sucos de laranja. Parece razoável deduzir que o cupom fiscal é referente a refeições de mais de uma pessoa — afinal, mesmo alguém com muito apetite raramente come três pratos e toma 4 bebidas. Claro, acontece. Mas é razoável suspeitar que isso se trata de um reembolso que cobre refeição de três pessoas. E é exatamente isso que a lei, aprovada pela mesma Câmara da qual o deputado faz parte, proíbe.

O [ato da mesa nº 43, de 21 de maio de 2009](http://www2.camara.leg.br/legin/int/atomes/2009/atodamesa-43-21-maio-2009-588364-norma-cd-mesa.html), que institui a CEAP determina no seu artigo segundo que a verba se destina, entre outras coisas, a ressarcir a alimentação do parlamentar — não incluindo assessores, convidados ou quem quer que seja.

{% include figure.html src='2017-06-12-como-lidar-com-um-legislativo-que-ignora-o-que-ele-mesmo-legisla-03.png' alt='Trecho da lei que estabelece a CEAP' %}

Ou seja, se o deputado era uma das três pessoas se alimentando com a comida daquele cupom fiscal, ele poderia ter descontado o valor das demais refeições e pedido um reembolso parcial (por exemplo, de R$ 30 pelo filé mais R$ 7 por dois dos sucos), mas não dos mais de R$ 100.

Mas ele não o fez. O questionamos sobre isso e a pérola da resposta, como já dita foi: a Câmara aprovou. Ou, se preferir, nas palavras dele: _Essa despesa foi avaliada e aprovada pelo departamento responsável na Câmara dos Deputados_. O deputado, além de ignorar a lei uma vez ao pedir reembolso de três refeições, não perdeu a chance de ignorar a lei uma segunda vez demonstrando enorme desconhecimento do parágrafo 10 do artigo 4º do mesmíssimo texto:

{% include figure.html src='2017-06-12-como-lidar-com-um-legislativo-que-ignora-o-que-ele-mesmo-legisla-04.png' alt='Trecho da lei que estabelece a CEAP' %}

> A Coordenação de Gestão de Cota Parlamentar do Departamento de Finanças, Orçamento e Contabilidade fiscalizará os gastos apenas no que respeita à regularidade fiscal e contábil da documentação comprobatória, cabendo exclusivamente ao Deputado responsabilizar-se pela compatibilidade do objeto do gasto com a legislação, fato que o parlamentar atestará expressamente mediante declaração escrita.

Em outras palavras o fato da Câmara ter _avaliado e aprovado_ o reembolso apenas diz respeito ao cupom fiscal — o documento é válido para demonstrar a despesa. No entanto a _compatibilidade_ do gasto com a lei não é de responsabilidade da Câmara.
e um deputado vai numa boate e pede reembolso por um filé mignon de R$ 400, alegando ser necessário para seu trabalho como parlamentar, a Câmara não tem base legal para rejeitar o pedido. Não cabe à administração Câmara avaliar se o motivo pelo qual o deputado pede reembolso é o que a lei determina para essa verba. Isso é de inteira responsabilidade do deputado.

Portanto, respostas como a do Dep. Roberto de Lucena valem, em uma escala de 0 a 10, nada. E são muitos usando a mesma desculpa para se justificar perante casos suspeitos que a Rosie tem encontrado. O Dep. Marcon, assim como muitos outros, [caiu nessa mesma falácia](http://www.deputadomarcon.com.br/noticias/ultimas-noticias/nota-deputado-marcon-sobre-refeicao-de-130-reais.html):

{% include figure.html src='2017-06-12-como-lidar-com-um-legislativo-que-ignora-o-que-ele-mesmo-legisla-05.png' alt='Página oficial do deputado' %}

> A Câmara possui um setor que analisa e aprova as prestações de contas de cada parlamentar, portanto, se este valor (que consumi e paguei) estivesse ferindo alguma norma da Casa este setor responsável teria apontado o problema e, certamente, não aprovaria minha despesa, devolvendo a nota sem ressarcimento.

Nós não caímos, senhores deputados. Mas os convidamos a ler e reler o ato da mesa nº 43, de 21 de maio de 2009 antes de induzirem seus eleitores ao erro — proposital ou acidentalmente.

---

Essa situação nos leva a três reflexões importantes sobre o futuro do controle social sobre os gastos públicos — ou seja, sobre o quanto realmente as instituições estão preparadas e dispostas a lidar com o direito dos cidadãos ficarem de olho em como os nossos impostos tem sido reinvestidos na sociedade:

## 1

Primeiro, ao encontrar possíveis desvios de dinheiro público, quais ferramentas estão de fato ao alcance da população para fazer com que esse dinheiro volte para a população? A Câmara, [como explicamos](https://medium.com/data-science-brigade/r-3-2-milh%C3%B5es-em-8-216-reembolsos-suspeitos-as-m%C3%A9tricas-do-trabalho-da-rosie-nos-%C3%BAltimos-dias-78d4cffd42b8), é a instância a se procurar nesses casos. Se os deputados ignoram os ofícios internos da administração da Câmara, ou se eles respondem à administração da Câmara coisas incompatíveis ou irrelevantes perante a lei, essa mesma Câmara não tem poder algum para solucionar ou investigar ou questionar a atitude do deputado.

## 2

Segundo, se resolvemos partir para a esfera jurídica, [já ouvimos](https://medium.com/data-science-brigade/r-3-2-milh%C3%B5es-em-8-216-reembolsos-suspeitos-as-m%C3%A9tricas-do-trabalho-da-rosie-nos-%C3%BAltimos-dias-78d4cffd42b8) que apenas casos com um valor elevado (alguns dizem R$ 10 mil, outros mais R$ 70 mil desviados) valeriam a pena. Isso quer dizer que se o processo visa cobrir danos ao erário, e se o custo do processo em si (salário de servidores, promotores, procuradores, juízes, mais equipamento e gastos marginais) for menor do que o dinheiro a ser reavido, na verdade o processo gerou mais prejuízo ao erário do que potencialmente poderia ter reavido. Entendemos os custos do judiciário: um salário de um procurador é entre R$ 30 e 40 mil, e o dos assessores também não são salários baixos. Mas o ponto que gostaríamos de deixar mais claro é que não se trata de R$ 100 reais, como no caso do Dep. Roberto de Lucena. Se trata de prevenir que esse comportamento continue, que essa sensação de impunidade se perpetue — em outras palavras, nos interessa mais o ganho social para o médio e longo prazo ao combater causas aparentemente pequenas como essas. Ou ainda, [nas palavras de um dos nossos seguidores no Reddit]:

> Só que tal processo também é importante para coibir desvios futuros de verba. Talvez valesse a pena intensificar os processos, tendo prejuízo inicialmente mas no longo prazo diminuindo os desvios. É um tipo de pressão que a sociedade civil deveria fazer, para diminuir esses limites. Seria uma mudança em direção à moralização a política

## 3

Terceiro e mais importante, a questão que fica é como combater a cultura endêmica de corrupção em um país onde deputados ignoram a própria lei que eles mesmos escrevem. Em diversas conversas com membros do poder público o argumento sempre esteve focado nos valores monetário, mas o que estamos fazendo tem dois significados muito mais profundos que isso. Antes de mais nada estamos exercendo nossos direitos cívicos, é a nossa forma de usar tecnologia como voz política que nos leva a levantar esses questionamentos. Além disso como cultivar uma cultura democrática se no embate de ideias nossos representantes legais agem de maneira personalista, patriarcal e ignorante perante as leis e o eleitorado? Como bem resumiu nossa mentora [Yaso](http://yaso.is), eles vivem em um eterno _se colar, colou_ — e quando o próprio legislativo é assim, o que se poderia sonhar de democracia já foi-se pelo ralo.

Não se trata aqui de focar na resposta de Robertos e Dionilsos. Nosso foco é em responsabilizar os nossos representantes de acordo com as regras que eles legislam. É nosso papel como cidadãos em uma democracia. Gostem eles ou não.

---

Continuamos em busca de melhores formas de levar esse diálogo com deputados e órgãos públicos. Dependemos de pessoas como você, que querem ver a continuidade do trabalho que iniciamos. Compartilhe esse texto, questione seu deputado e nos conte suas ideias e acompanhe nosso trabalho [no Facebook](https://www.facebook.com/operacaoSerenataDeAmor/) e aqui no [Medium](http://www.medium.com/data-science-brigade).

[Clique aqui e acesse a nossa página no APOIA.se](http://apoia.se/serenata), e também aceitamos doações em Bitcoin: [`1Gbvfjmjvur7qwbwNFdPSNDgx66KSdVB5b`](https://blockchain.info/address/1Gbvfjmjvur7qwbwNFdPSNDgx66KSdVB5b).
