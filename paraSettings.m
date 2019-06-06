function [optmParameter] = paraSettings(dataset)

switch dataset
     case 'Yeast'
         optmParameter.alpha = 1;
         optmParameter.beta = 0.1;
         optmParameter.gamma = 1;
         optmParameter.numCluster = 4;


end
end