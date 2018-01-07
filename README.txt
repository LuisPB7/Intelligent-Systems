Para chegar ao modelo final, foi necessária a criação e avaliação de vários modelos (NN, Fuzzy, NeuroFuzzy).
Aqui vamos descrever os passos para chegar ao nosso modelo final, e como foram preenchidas as tabelas dos resultados obtidos.
Como usamos algoritmos genéticos (ga) para escolher as melhores features, criámos scripts que chamam este algoritmo sobre o modelo escolhido.

Para correr o nosso código é necessário antes de tudo, correr o script "Config.m" (para ter acesso às diretorias)


ESCOLHER OS MELHORES MODELOS:

O script "OptimizationsScript.m" tem as linhas de código necessárias para correr os algoritmos genéticos
para cada modelo e para cada tipo de dataset. Uma vez corrido essas linhas, é imprimido na linha de comandos
as melhores features e o hyperparameter a escolher.

Para escolher qual a função de fitness, devemos ir à pasta "Optimizations"
que tem um script para cada modelo, e modificar a variável "optimizeTo" para 'TPR' ou '' sendo 
True Positive Rate or Accuracy respetivamente.

Exemplo:
Para a primeira entrada da tabela  "Multi-Layer Perceptron Experiments" devemos:

1-Comentar todas as linhas do "OptimizationsScript.m" menos as linhas 3,4,5
2-Ir ao script "geneticNet.m" dentro da pasta "Optimizations" e a colocar a variável (optimizeTo = '')
3-Correr o script "OptimizationsScript.m"
4-Quando acabar de correr vai ser visível na linha de comandos os parâmetros escolhidos pelo Algoritmo genético e a accuracy.


ESCOLHER O MELHOR ENSEMBLE:

Como foram usados dois tipos de fitness function no ga, existe o ensemble com modelos optimizados para accuracy ("BuildEnsemble.m")
e otimizados para TPR ("BuildEnsembleTPR.m"). Estes dois scripts são necessários para criar os modelos que vão ser usados no ensemble, 
dentro deles define-se os parâmetros ótimos dos modelos.

Para preencher as tabelas do ensemble, existem os seguintes tipos de ensemble:
experimentSum e experimentSumTPR, para The Regular Voting Ensemble Model Experiments
experimentHierarchic e experimentHierarchicTPR, para The Shared Hierarchic Voting Ensemble Model
experimentHierarchic2 e experimentHierarchic2TPR, para The Hierarchic Voting Ensemble Model, without shared weights

O script "geneticEnsemble.m" dentro da pasta Optimizations, é onde se vai usar o ga para calcular os pesos ótimos.
Dentro deste script na linha 16 e 18 está qual o tipo de ensemble que pretendemos correr, basta substituir 
 '@experimentSum' e '@experimentSumTPR' pelo tipo desejado.

Exemplo:
Para a primeira entrada do "The Regular Voting Ensemble Model Experiments" devemos:
1-Correr o script "BuildEnsemble.m" tendo preenchido dentro do script os parâmetros de cada modelo
2-Ir ao script "geneticEnsemble.m" dentro da pasta "Optimizations" e a colocar a variável (optimizeTo = '')
3-Ir ao script "geneticEnsemble.m"  e mudar os argumentos das linhas 16 e 18 para '@experimentSumTPR' e  '@experimentSum' respetivamente
4- correr "geneticEnsemble.m"  
5-Quando acabar de correr vai estar no Workspace uma variável X que contem os pesos ótimos, podemos correr agora
a função "experimentSum(X)"  que vai imprimir na linha de comandos a confusion matrix e a accuracy do ensemble 
