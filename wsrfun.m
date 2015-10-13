function wsr = wsrfun(s,Ks,distr,par1,par2)

pikm = prod(factorial(Ks));
P = 1;
for m = 1:s,
    km = Ks(m);
    P = P*(skfun(m+2,distr,par1,par2))^km;
end, 
wsr = P/(pikm);
