% This script is used to generate N number of malignant spectra and N
% benign spectra. The code essentially just randomly selects M (specified
% by the user) number of samples for each classes from a generated dataset
% for each of the classes (PCA_mal_gen.mat and PCA_ben_gen.mat). See the
% script "generatePseudodata.mat" to know more how the generation works.
% 
% The authors are unable to provide the original dataset. Hence, the
% provision of this alternate dataset which is sufficient to validate the
% study's findings. 
% 
% Note that the original generated datasets consist of 5000 samples for
% each class, in contrast to the original dataset which only consists of 50
% samples for each class. More samples can be generated using
% "generatePseudodata.mat". However, care must be exercised not to override
% the original generated datasets since these are direct products of the
% original dataset. The reason for this is that the aformentioned script
% can no longer utilize the original dataset hence can only generate new
% data using the original generated datasets. This said, there would be an
% accumulation of "unauthenticity" if the original generated dataset be
% replaced. Statistically, though, since the number of samples in the
% original generated dataset is much more than that of the original data
% set (5000>>50), we can assume that the total variation exhibited in the
% original dataset is already captured in the original generated dataset
% that this accumulation can be ignored.
%
% A copy of the original generated dataset is saved in the org_data
% directory in case considerable accumulation is noticed.

clc; 
clear all;

%% loading the databases and relevant variables

load("PCA_ben_gen.mat");
load("PCA_mal_gen.mat");
load("V_ben.mat");
load("V_mal.mat");

%% obtaining data

M = 50; % obtains 50 new data. 

% randomly selecting M number of benign sample readings from the original
% generated dataset.
N = size(PCA_ben_gen,1);
n = randi(N,M,1);
X_ben = PCA_ben_gen(n,:)*V_ben';

% randomly selecting M number of malignant sample readings from the 
% original generated dataset.
N = size(PCA_mal_gen,1);
n = randi(N,M,1);
X_mal = PCA_mal_gen(n,:)*V_mal';

%% plotting the data (optional)

% hold on;
% plot(X_ben','b');
% plot(X_mal','r');

%% saving the data
X = [X_ben;X_mal];
Y = [zeros(M,1);ones(M,1)];

save("X","X");
save("Y","Y");



