clear;clc

addpath('evaluation/');
addpath('IMCCdata/');

load('Yeast');

param.numCluster = 8; % numCluster ranges from 2.^{3, 4, 5, 6, 7, 8}
param.alpha = 1; % alpha ranges from 10^{-3, -2, -1, 0, 1, 2, 3}
param.beta = 1; % beta ranges from 10^{-3, -2, -1, 0, 1, 2, 3}
param.gamma = 0.1; % gamma ranges from 10^{-3, -2, -1, 0, 1, 2, 3}

[results] = IMCC( train_data, train_target, test_data, test_target, param );
