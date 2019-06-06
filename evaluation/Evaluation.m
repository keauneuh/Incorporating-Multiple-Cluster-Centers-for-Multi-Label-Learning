
function ResultAll = Evaluation(Pre_Labels,Outputs,test_target)
% evluation for MLC algorithms, there are fifteen evaluation metrics
% 
% syntax
%   ResultAll = EvaluationAll(Pre_Labels,Outputs,test_target)
%
% input
%   test_targets        - L x num_test data matrix of groundtruth labels
%   Pre_Labels          - L x num_test data matrix of predicted labels
%   Outputs             - L x num_test data matrix of scores
%
% output

    ResultAll=zeros(5,1); 

    HammingLoss=Hamming_loss(Pre_Labels,test_target);
    RankingLoss=Ranking_loss(Outputs,test_target);
    OneError=One_error(Outputs,test_target);
    Coverage=coverage(Outputs,test_target);
    Average_Precision=Average_precision(Outputs,test_target);

    
    ResultAll(1,1)=OneError;
    ResultAll(2,1)=HammingLoss;
    ResultAll(3,1)=RankingLoss;
    ResultAll(4,1)=Coverage;
    ResultAll(5,1)=Average_Precision;


 
end
