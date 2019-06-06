function [ Result ] = IMCC( train_data,train_target,test_data,test_target,param)

 
    
[m, n] = size(train_data);
[t, l] = size(test_target);

[idx, Z] = kmeans(train_data, param.numCluster); 

T = zeros(param.numCluster, l);

for i = 1:param.numCluster
   idx_tmp = find(idx == i);
   T(i,:) = mean(train_target(idx_tmp,:));
end

Zprime = Z(idx,:);

Y = train_target;
ker = 'rbf';
par = mean(pdist(train_data));
Kxx = kernelmatrix(ker, train_data', train_data', par); % m by m
Kzx = kernelmatrix(ker, Z', train_data', par); % c by m
Kpx = kernelmatrix(ker, Zprime', train_data', par); % m by m
Ktx = kernelmatrix(ker, test_data', train_data', par);
Kg = Kxx-Kpx; % m by m
m1 = ones(m,1);
c = param.numCluster;
c1 = ones(c,1);
I = eye(m,m);
epsilon = 1e-10;
Kxx2 = Kxx'*Kxx;
Kzx2 = Kzx'*Kzx;
Kg2 = Kg'*Kg;

A = (Kxx2+param.alpha*Kzx2+param.beta*Kg2+param.gamma*Kxx - ((Kxx'*m1+param.alpha*Kzx'*c1)/(m+param.alpha*c)*(m1'*Kxx+param.alpha*c1'*Kzx))+epsilon*I)\(Kxx'*Y+param.alpha*Kzx'*T-((Kxx'*m1+param.alpha*Kzx'*c1)/(m+param.alpha*c)*(m1'*Y+param.alpha*c1'*T)));
b = 1/(m+param.alpha*c)*((Y'-A'*Kxx')*m1+param.alpha*(T'-A'*Kzx')*c1);

test_outputs = Ktx*A+ones(t,1)*b';

pre_labels = zeros(t,l);
pre_labels(find(test_outputs >= 0)) = 1;
pre_labels(find(test_outputs < 0)) = -1;

Result = Evaluation(pre_labels',test_outputs',test_target');

end


