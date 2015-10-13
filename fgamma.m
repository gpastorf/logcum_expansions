function value = fgamma(X,r)

k = r+2;
value = kumfun(k,'samp',X,[]);
% value = kumfun(k,'samp',X,[])/(kumfun(2,'samp',X,[])^(k/2));
