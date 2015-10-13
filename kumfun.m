function value = kumfun(k,distr,par1,par2)

switch distr
    case 'chi2', value = factorial(k-1)*par1*2^(k-1)/(sqrt(2*par1)^k);
    case 'gamm', value = psi(k-1,par1);
    case 'genK', value = psi(k-1,par1) + psi(k-1,par2);
    case 'alph', value = ((-1)^k)*(1/par1^k-1)*psi(k-1,1);
    case 'samp',
        switch k
            case 2, value = moment(par1,2);
            case 3, value = moment(par1,3);
            case 4, value = moment(par1,4) - 3*moment(par1,2)^2;
            case 5, value = moment(par1,5) - 10*moment(par1,3)*moment(par1,2);
            case 6, value = moment(par1,6) - 15*moment(par1,4)*moment(par1,2) - 10*moment(par1,3)^2 + 30*moment(par1,2)^2;
        end,
end,
