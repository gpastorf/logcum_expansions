function fx = fksedgeworth(x,k,suppx)
%   fX = FKSEDGEWORTH(x,k,suppfx)
%
%   Edgeworth expansion with k terms on suppfx of sample data X using its
%   cumulants.
%
%   Inputs:
%       x       : sample data
%       k       : number of terms in expansion, K < 5
%       suppx   : support of x, i.e. [min(x):dx:max(x)]
%
%   Output:
%       fX      : density approximation
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

fx = zeros(k,length(x));
for ko = 1:k,
    for k = 1:length(x),
        xk = x(k);
        S = 1;
        for s = 1:ko,
            KS = Ksfun(s);
            Ssr = 0;
            for sr = 1:size(KS,1),
                Ks = KS(sr,:);
                r = sum(Ks);
                Ssr = Ssr + wsrfun(s,Ks,'samp',suppx,[])*Hen(s+2*r,xk);
            end,
            S = S + Ssr;
        end,
        fx(ko,k) = S;
    end,
    fx(ko,:) = phifun(x).*fx(ko,:);
end,
