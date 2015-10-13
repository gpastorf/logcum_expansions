function xq = tkscornish(x,qx,t,k)
%   xq = TKSCORNISH(x,qx,t,k)
%
%   Cornish-Fisher expansion with k terms on the quantiles qx of sample 
%   data X using its cumulants of the t-th kind.
%
%   Inputs:
%       x       : sample data
%       qx      : desired quantiles
%       k       : number of terms in expansion, K < 5
%       t       : kind statistics: 1 first; 2 second
%
%   Output:
%       xq      : quantiles approximation
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
%   Copyright: Giancarlo Pastor, 2015.
%

if t == 2,
    x = log(x); % SKS
end,

mu = mean(x); sigma = std(x);
x = (x-mu)/sigma;
xq = norminv(qx,0,1);
zq = zeros(size(xq));
for kl = 1:length(xq);
    zq(kl,1) = xq(kl) + ...
        fgamma(x,1)*fh(xq(kl),1);
    zq(kl,2) = zq(kl,1) + ...
        fgamma(x,2)*fh(xq(kl),2) + ...
        fgamma(x,1)^2*fh(xq(kl),11);
    zq(kl,3) = zq(kl,2) + ...
        fgamma(x,3)*fh(xq(kl),3) + ...
        fgamma(x,1)*fgamma(x,2)*fh(xq(kl),12) + ...
        fgamma(x,1)^3*fh(xq(kl),111);
    zq(kl,4) = zq(kl,3) + ...
        fgamma(x,4)*fh(xq(kl),4) + ...
        fgamma(x,2)^2*fh(xq(kl),22) + ...
        fgamma(x,1)*fgamma(x,3)*fh(xq(kl),13) + ...
        fgamma(x,1)^2*fgamma(x,2)*fh(xq(kl),112) + ...
        fgamma(x,1)^4*fh(xq(kl),1111);
end,
zq = zq(:,1:k);
xq = mu + sigma*zq;

if t == 2,
    xq = exp(xq);
end,
