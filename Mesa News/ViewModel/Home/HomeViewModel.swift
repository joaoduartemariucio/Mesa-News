//
//  HomeViewModel.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()
    
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var noticias: BehaviorRelay<[NoticiaCodable]> = BehaviorRelay<[NoticiaCodable]>(value:
        [
            NoticiaCodable(
                title: "Superintendente da PF no Amazonas que apresentou notícia-crime contra Salles é substituído",
                descricaoNoticia: "Alexandre Saraiva comandava a investigação da maior apreensão de madeira do país, Na quarta (14), ele pediu ao STF que investigue o ministro do Meio Ambiente, Ricardo Salles, por atrapalhar o trabalho da PF.\n\nA direção da Polícia Federal substituiu nesta quinta-feira (15) o superintendente no Amazonas. Alexandre saraiva comandava a investigação da maior apreensão de madeira do país. Na quarta-feira (14), ele pediu ao Supremo Tribunal Federal que investigue o ministro do Meio Ambiente, Ricardo Salles, por atrapalhar o trabalho da Polícia Federal.\n\nEm entrevista à GloboNews, antes de ser exonerado, o delegado Alexandre Saraiva disse que tinha obrigação de apresentar uma notícia-crime contra o ministro do Meio Ambiente ao Supremo Tribunal Federal.\n\n“Não é todo dia que um superintendente faz isso, mas também não é todo dia que um ministro de uma outra pasta se arvora a promover a defesa de infratores ambientais”, afirmou Saraiva.\n\nNa notícia-crime, o delegado afirma que o ministro Ricardo Salles e o senador Telmário Mota, do PROS de Roraima, e o presidente do Ibama, Eduardo Bim, agiram para dificultar a ação fiscalizadora do poder público em questões ambientais e que, além disso, há fortes indícios de terem praticado crime de advocacia administrativa - patrocinar, direta ou indiretamente, interesse privado perante a administração pública, valendo-se da qualidade de funcionário.\n\nSegundo o delegado, os crimes começaram depois que a Polícia Federal fez, no Pará, no fim de 2020, a maior apreensão de madeira do país: mais de 200 mil metros cúbicos, ou cerca de 65 mil árvores derrubadas.\n\nNa denúncia, o delegado diz que em razão da magnitude dos resultados, o setor madeireiro iniciou a formação de parcerias com integrantes do Poder Executivo, podendo-se citar o ministro do Meio Ambiente Ricardo Salles e o parlamentar Telmário Mota no intento de causar obstáculos à investigação.\n\nA PF cita como exemplos manifestações de Telmário nas redes sociais e a visita de Salles, na semana passada, ao local da apreensão. Salles voltou a defender a liberação da madeira. O ministro se reuniu com empresários e disse que ouviu deles que as árvores tinham sido derrubadas dentro da lei e pediu pressa na análise de documentos entregues pelos madeireiros.\n\nA Polícia Federal analisou os documentos e identificou fraudes na concessão das terras públicas onde os madeireiros derrubaram as árvores. De acordo com investigadores, as áreas foram obtidas por meio de grilagem de terras, portanto, a madeira extraída de lá é ilegal. Segundo o delegado Alexandre Saraiva, essa mesma fraude se repetiu em outras áreas. Ainda de acordo a investigação, a maioria dos madeireiros não respeitou os limites do plano de manejo.\n\nSobre o presidente do Ibama, Eduardo Bim, o delegado afirma que o órgão, desde o início da operação, manteve-se inerte, desinteressado em exercer seus poderes de polícia ambiental, o que desperta a existência de interesses escusos, provavelmente a mando do ministro do Meio Ambiente.\n\nA notícia-crime chegou nesta quinta (15) ao gabinete do presidente do Supremo, ministro Luiz Fux, mas a TV Globo apurou que o STF decidiu não transformar a notícia crime em um processo porque o delegado Alexandre Saraiva não usou o meio correto para enviá-la. Ele mandou uma e-mail para o Supremo, mas deveria ter peticionado como um processo eletrônico ou protocolado pessoalmente no Supremo.\n\nSaraiva foi substituído no momento em que tentava apertar a fiscalização. Nos bastidores, a avaliação foi de que a atuação independente de delegado foi decisivo para a demissão dele.\n\nEm nota nesta quinta-feira (15), a Polícia Federal confirmou a troca de cinco superintendências: de Santa Catarina, Roraima, São Paulo, Bahia e Amazonas, que era comandada por Alexandre Saraiva.\n\nSaraiva tem proximidade com a família Bolsonaro e até já participou de uma live com o presidente. Para o lugar dele, a PF indicou o delegado Leandro Almada.\n\nCarioca, Leandro Almada é visto como uma pessoa ligada a Alexandre Saraiva, que também é do Rio. Ele já foi policial civil e é delegado da PF há 13 anos.\n\nLeandro Almada já atuou no Amazonas, principalmente na repressão ao tráfico de drogas, mas também já foi chefe do Núcleo de Investigação de Crimes Ambientais e diretor-executivo da PF no Amazonas, o segundo cargo mais importante da polícia no estado, diretamente subordinada à Saraiva.\n\nEle estava trabalhando em Minas Gerais na investigação da imunização clandestina contra a Covid. A Polícia Federal também mudou o comando de seis diretorias, uma delas, a de combate ao crime organizado.\n\nLíderes da oposição na Câmara pediram ao Ministério Público Federal a apuração da mudança de comando na superintendência do Amazonas.\n\nO Senador Telmário Mota, do PRÓS, declarou que o delegado Alexandre Saraiva busca os holofotes, com o que chamou de notícia-crime 'patética' e 'sem fundamento'. Segundo Telmário Mota, o delegado criminaliza todo um setor sem distinguir quem está na ilegalidade ou não.\n\nO Ministério do Meio Ambiente informou que vai responder ao delegado na Justiça. A direção do Ibama não se manifestou.",
                content: "Jornal Nacional",
                author: "Jornal Nacional",
                publishedAt: "15/04/2021 23h03",
                highlight: false,
                url: "https://g1.globo.com/jornal-nacional/noticia/2021/04/15/superintendente-da-pf-no-amazonas-que-apresentou-noticia-crime-contra-salles-e-substituido.ghtml",
                imageURL: "https://cdn.domtotal.com/img/noticias/2020-05/1443294_445543.jpg"
            ),
            NoticiaCodable(
                title: "Reação de Bolsonaro ao ler notícia durante live vira meme nas redes",
                descricaoNoticia: "Não é de hoje que as lives semanais de Bolsonaro viram notícias e/ou memes.\n\nA desta quinta-feira (15) entra no rol dos dois casos.\n\nCom Lula de volta ao páreo após decisão do STF de anular as condenações do petista, o presidente Jair Bolsonaro (sem partido) gastou parte de seu tempo para se contrapor ao adversário, reforçando discurso anticorrupção e afirmando que sua eventual volta trará retrocessos ao país.\n\nAgora vem a parte dos memes.\n\nDurante a transmissão, Bolsonaro também comentou a decisão da ministra Cármen Lúcia, do STF (Supremo Tribunal Federal), que estabeleceu prazo de cinco dias para que o presidente da Câmara, Arthur Lira (PP-AL), explique a não abertura dos mais de 100 processos de impeachment do chefe do Executivo.\n\nO prazo estabelecido por Cármen Lúcia, uma medida de praxe, responde a um mandado de injunção apresentado pelo advogado Ronan Wielewski Botelho, que questiona por que os pedidos não foram analisados.\n\nDisse o presidente, com tom de ironia ao final da fala.\n\n“Mais alguma coisa? Encerrando, quero ler mais uma vez uma notícia muito importante. Tá no Antagonista. Não gosto de replicar, de falar de coisas de Antagonista, Veja, Folha, porque tem muita fake news, mas pelo que nós levantamos até agora a notícia é verdadeira. A ministra do Supremo Tribunal Federal, Cármen Lúcia, deu um prazo de cinco dias para que o presidente da Câmara Arthur Lira explique a não abertura dos processos de impeachment contra o presidente Jair Bolsonaro. Boa noite. Fique tranquilo que eu vou dormir tranquilíssimo esta noite e vamos ver o desenrolar desta notícia aqui do nosso Supremo Tribunal Federal”.",
                content: "Folha De S.Paulo",
                author: "Mateus Camillo",
                publishedAt: "16.abr.2021 às 16h32",
                highlight: false,
                url: "https://hashtag.blogfolha.uol.com.br/2021/04/16/reacao-de-bolsonaro-ao-ler-noticia-durante-live-vira-meme-nas-redes/",
                imageURL: "https://hashtag.blogfolha.uol.com.br/files/2021/04/bolsonaro.jpg"
            )
        ]
    )
}
