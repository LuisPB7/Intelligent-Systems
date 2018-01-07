Para chegar ao modelo final, foi necess�ria a cria��o e avalia��o de v�rios modelos (NN, Fuzzy, NeuroFuzzy).
Aqui vamos descrever os passos para chegar ao nosso modelo final, e como foram preenchidas as tabelas dos resultados obtidos.
Como usamos algoritmos gen�ticos (ga) para escolher as melhores features, cri�mos scripts que chamam este algoritmo sobre o modelo escolhido.

Para correr o nosso c�digo � necess�rio antes de tudo, correr o script "Config.m" (para ter acesso �s diretorias)


ESCOLHER OS MELHORES MODELOS:

O script "OptimizationsScript.m" tem as linhas de c�digo necess�rias para correr os algoritmos gen�ticos
para cada modelo e para cada tipo de dataset. Uma vez corrido essas linhas, � imprimido na linha de comandos
as melhores features e o hyperparameter a escolher.

Para escolher qual a fun��o de fitness, devemos ir � pasta "Optimizations"
que tem um script para cada modelo, e modificar a vari�vel "optimizeTo" para 'TPR' ou '' sendo 
True Positive Rate or Accuracy respetivamente.

Exemplo:
Para a primeira entrada da tabela  "Multi-Layer Perceptron Experiments" devemos:

1-Comentar todas as linhas do "OptimizationsScript.m" menos as linhas 3,4,5
2-Ir ao script "geneticNet.m" dentro da pasta "Optimizations" e a colocar a vari�vel (optimizeTo = '')
3-Correr o script "OptimizationsScript.m"
4-Quando acabar de correr vai ser vis�vel na linha de comandos os par�metros escolhidos pelo Algoritmo gen�tico e a accuracy.


ESCOLHER O MELHOR ENSEMBLE:

Como foram usados dois tipos de fitness function no ga, existe o ensemble com modelos optimizados para accuracy ("BuildEnsemble.m")
e otimizados para TPR ("BuildEnsembleTPR.m"). Estes dois scripts s�o necess�rios para criar os modelos que v�o ser usados no ensemble, 
dentro deles define-se os par�metros �timos dos modelos.

Para preencher as tabelas do ensemble, existem os seguintes tipos de ensemble:
experimentSum e experimentSumTPR, para The Regular Voting Ensemble Model Experiments
experimentHierarchic e experimentHierarchicTPR, para The Shared Hierarchic Voting Ensemble Model
experimentHierarchic2 e experimentHierarchic2TPR, para The Hierarchic Voting Ensemble Model, without shared weights

O script "geneticEnsemble.m" dentro da pasta Optimizations, � onde se vai usar o ga para calcular os pesos �timos.
Dentro deste script na linha 16 e 18 est� qual o tipo de ensemble que pretendemos correr, basta substituir 
 '@experimentSum' e '@experimentSumTPR' pelo tipo desejado.

Exemplo:
Para a primeira entrada do "The Regular Voting Ensemble Model Experiments" devemos:
1-Correr o script "BuildEnsemble.m" tendo preenchido dentro do script os par�metros de cada modelo
2-Ir ao script "geneticEnsemble.m" dentro da pasta "Optimizations" e a colocar a vari�vel (optimizeTo = '')
3-Ir ao script "geneticEnsemble.m"  e mudar os argumentos das linhas 16 e 18 para '@experimentSumTPR' e  '@experimentSum' respetivamente
4- correr "geneticEnsemble.m"  
5-Quando acabar de correr vai estar no Workspace uma vari�vel X que contem os pesos �timos, podemos correr agora
a fun��o "experimentSum(X)"  que vai imprimir na linha de comandos a confusion matrix e a accuracy do ensemble 
