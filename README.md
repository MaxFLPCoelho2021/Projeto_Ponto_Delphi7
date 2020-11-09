# Projeto_Ponto_Delphi7

Processo seletivo para programação

Aplicativo para C ontrole de P onto I ndividual

Caso de uso

Os funcionários da F ábrica de B iscoitos A manteigados estão com dificuldades em controlar seu expediente na linha de produção. Existe uma máquina de ponto na entrada do galpão, onde cada um aproxima seu crachá a um leitor e a máquina 'marca o ponto', imprimindo um ticket - uma tira de papel com a data, o nome do funcionário e o horário da marcação.
O volume de papéis aumenta muito em cima da mesa e está confundindo o trabalhador, que fica sem saber se já está na hora de sair, se esqueceu a marcação do retorno do almoço, se foram feitas horas extras ou atraso no dia anterior.
Cada funcionário sempre realiza quatro marcações de ponto por dia: entrada, saída para almoço, volta do almoço, saída. As marcações podem ser no intervalo que quiser, desde que ao final do dia tenha completado 8 horas de trabalho. Ninguém controla feriados, fim de semana ou faltas.
Os funcionários solicitaram a você um aplicativo permita o lançamento manual dos tickets de ponto, para então consultar as marcações realizadas do mês. Ao receber a folha de ponto da fábrica e o pagamento das horas extras no contracheque, seja possível comparar a jornada e entender o valores recebidos.

Requisitos

Cada funcionário terá seu próprio programa rodando em seu 'pendrive'. As informações não serão compartilhadas entre eles. Ao executar o programa, será apresentada uma tela inicial com todas as funções disponíveis.

1. Tela principal
◦ Quatro botões grandes, correspondendo a cada uma das funções do sistema.

2. Funções
◦ Registrar o ponto
▪ Uma tela com um campo para informar a data, os quatro campos de digitação do horário das marcações, e os botões de gravar e cancelar.
Ao clicar gravar, a informação será armazenada, e a tela permite a digitação de uma nova marcação. 
Ao clicar cancelar, as informações digitadas são descartadas e o sistema volta para a tela principal.
◦ Relatório de ponto
▪ Uma primeira tela irá conter uma 'seleção do mês' e o botão 'visualizar'.
A seleção do mês pode ser um campo apenas para o lançamento do mês/ano, vindo preenchido com o mês corrente. 
Ao clicar visualizar, será aberta a tela do relatório.
▪ Tela para o relatório
▪ Pode ser uma tela com campo 'memo' de fundo branco, ocupando toda a área da tela (como uma folha de papel), usando fonte monoespaçada, sem permitir edição.
▪ O relatório terá um cabeçalho com o título, nome do funcionário e função, data e hora de geração.
No corpo do relatório, cada dia de marcação será uma linha, com a data da marcação e os horários separados por espaços.
◦ Consulta de Horas extras e atrasos
▪ Uma tela que irá conter um 'painel de filtro' no topo, e abaixo um grid ocupando toda a largura da tela. O painel de filtro pode ser a 'seleção do mês' e o botão 'consultar'. Pode ser exibido o nome do funcionário e a função antes dos campos.
▪ Ao clicar consultar, será processada a consulta e o resultado aparecerá no grid.
▪ O grid terá três colunas; A primeira com a data da marcação, a segunda com a hora extra, a terceira o atraso do dia.
Dica: o funcionário pode ter ou atraso ou hora extra, não ambos. E somente aparecem na consulta os dias onde houve alguma ocorrência.
▪ Deve existir também uma informação com o total de horas extras do mês. Pode ser abaixo do grid.
◦ Configurações
▪ Dois campos texto para informar o nome completo do funcionário e o cargo, e um botão gravar. Ao clicar gravar o sistema armazena as informações e fecha a tela.
Essas informações estarão disponíveis para a consulta e o relatório.
Proteções
• O funcionário pode fazer o lançamento de suas marcações quando quiser, de qualquer data, exceto datas futuras (o sistema deve comparar a data da marcação com o dia atual do computador).
• Se algum dos horários não estiver entre entre 06 e 23 horas, o sistema deve apresentar uma mensagem ao gravar e voltar o foco para o campo com problemas.
• O funcionário não poderá emitir o relatório de ponto se ainda não tiver cadastrado seu nome e função na tela de configurações.

Especificações de linguagem

• O programa deve ser escrito preferencialmente em Delphi 7 ou Delphi XE2.
• Os componentes utilizados devem ser VCL. O aplicativo não deve depender de componentes de terceiros ou ser compilado com pacotes runtime.
• Você pode utilizar acesso a banco de dados (desde que nativo do Delphi), porém não é necessário. Podem ser utilizadas estruturas de dados com armazenamento local, como ClientDataSet, IniFile, TStringList etc sendo gravado na própria pasta do executável.
• Você pode escolher se quer trabalhar com horas ou minutos nos cálculos, na consulta e no relatório. Contudo, deve ser adotada a mesma escolha em todos os pontos.
• Onde o requisito menciona 'pode ser' indica uma sugestão de como implementar, porém você pode fazê-lo da forma como preferir, desde que atenda ao requisito.
• Quanto a aparência, apenas o alinhamento dos controles na tela e a similaridade aos mockups serão avaliados. Não é necessário aplicar temas, cores, imagens de fundo, ícones (exceto os botões da tela principal) ou outras preocupações com design. Será levado em conta o seu bom gosto na disposição das informações.
