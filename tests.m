%
%   Test the expansions developed in
%
%       G. Pastor, I. Mora-Jimenez, A.J. Caamano, and R. Jantti
%       "Log-Cumulants-based Edgeworth Expansion for Skew-Distributed
%       Aggregate Interference"
%       IEEE Proc. of the 11th ISWCS, 2014
%
%       G. Pastor, I. Mora-Jimenez, A.J. Caamano, and R. Jantti
%       "Asymptotic Expansions for Heavy-tailed Data"
%       Submitted to IEEE Signal Processing Letters in 2015
%
%   for normal and log-normal data.
%
%   Copyright: Giancarlo Pastor, 2015.
%

clc, close all, clear all, format compact,

k = 3; % order of expansions, k < 5


% TEST 1: (NON-NEGATIVE) (NEARLY-)NORMAL DATA, x > 0
% x = randn(1,1e3)+10; xgrd = (-3:.05:3)+10;


% TEST 2: (NEARLY-)LOG-NORMAL DATA
x = lognrnd(0,.5,1,1e3); xgrd = 0:.05:5;


% Edgeworth expansion using cumulants (EEC)
[fX_EEC,suppfX_EEC] = tksedgeworth(x,1,k);

% Edgeworth expansion using log-cumulants (EEL)
[fX_EEL,suppfX_EEL] = tksedgeworth(x,2,k);

qx = (0:.01:1)';
% Cornish-Fisher expansion using cumulants (CFEC)
xqCFC = tkscornish(x,qx,1,k);

% Cornish-Fisher expansion using log-cumulants (CFEL)
xqCFL = tkscornish(x,qx,2,k);

figure, hold on,
plot(suppfX_EEC,fX_EEC,'-.','LineWidth',1.2),
plot(suppfX_EEL,fX_EEL,'LineWidth',1.2),
legend('EEC, k = 1','EEC, k = 2','EEC, k = 3',...
    'EEL, k = 1','EEL, k = 2','EEL, k = 3'), grid

figure, hold on,
plot(xqCFC,qx,'-.','LineWidth',1.2),
plot(xqCFL,qx,'LineWidth',1.2),
legend('CFEC, k = 1','CFEC, k = 2','CFEC, k = 3',...
    'CFEL, k = 1','CFEL, k = 2','CFEL, k = 3'), grid,
