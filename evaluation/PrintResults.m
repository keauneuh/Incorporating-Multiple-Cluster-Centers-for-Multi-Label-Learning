function PrintResults(dataname,Result,optmParameter)
        fp=fopen(dataname,'a');
        fprintf(fp,'------------%s----------------------\n',dataname);
        fprintf(fp,'alpha=%.4f beta=%.4f gamma=%.4f numCluster=%.4f\r\n',optmParameter.alpha,optmParameter.beta,optmParameter.gamma,optmParameter.numCluster);
        fprintf(fp,'Evalucation Metric    Mean   \n');
        fprintf(fp,'------------------------------------\n');
        fprintf(fp,'%s              %.4f  \r',measure,Result(1,1));
%        fprintf(fp,'OneError              %.4f  \r',Result(1,1));
%         fprintf(fp,'HammingLoss           %.4f  \r',Result(2,1));
%         fprintf(fp,'RankingLoss           %.4f  \r',Result(3,1));
%         fprintf(fp,'Coverage              %.4f  \r',Result(4,1));
%         fprintf(fp,'Average_Precision     %.4f  \r',Result(5,1));
%         fprintf(fp,'MacroF1Measure        %.4f  \r',Result(6,1));
%         fprintf(fp,'MicroF1Measure        %.4f  \r',Result(7,1));
%         fprintf(fp,'averaging auc         %.4f  \r',Result(8,1));
        fprintf(fp,'------------------------------------\n');
        fclose(fp);
end