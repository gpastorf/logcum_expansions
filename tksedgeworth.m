function [fX,suppfX] = tksedgeworth(x,t,k)
%   [fX,suppfX] = TKSEDGEWORTH(x,t,k)
%
%   Edgeworth expansion with k terms of sample data X using its
%   cumulants of the t-th kind.
%
%   Inputs:
%       x       : sample data
%       k       : number of terms in expansion, K < 5
%       t       : kind statistics: 1 first; 2 second
%
%   Output:
%       fX      : density approximation
%       suppfX  : support of p_app
%
%   For more details, see the papers:
% 
%   G. Pastor, I. Mora-Jimenez, A.J. Caamano, and R. Jantti
%   "Log-Cumulants-based Edgeworth Expansion for Skew-Distributed
%   Aggregate Interference"
%   IEEE Proc. of the 11th ISWCS, 2014
%
%   G. Pastor, I. Mora-Jimenez, A.J. Caamano, and R. Jantti
%   "Asymptotic Expansions for Heavy-tailed Data"
%   Submitted to IEEE Signal Processing Letters in 2015
%
%   S. Blinnikov and R. Moessner
%   "Expansions for nearly Gaussian distributions"
%   Astronomy and Astrophysics Supplement Series, 1998
%   (This paper derives coefficients for K > 4.)
%
%   Copyright: Giancarlo Pastor, 2015.
%

if t == 2,
    Z = log(x);
else
    Z = x;
end,
muZ = mean(Z);
siZ = sqrt(var(Z));
Y = (Z-muZ)/siZ;
y = min(Y):(max(Y)-min(Y))/100:max(Y);
pyapp = fksedgeworth(y,k,Y);
z = siZ*y+muZ;
for s = 1:k,
    fX(s,:) = pyapp(s,:)/siZ;
end,

if t == 2,
    suppfX = exp(z);
    for s = 1:k,
        fX(s,:) = fX(s,:)./exp(z);
    end,
else
    suppfX = z;
end,
