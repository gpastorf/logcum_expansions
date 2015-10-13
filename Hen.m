function value = Hen(n,x)

S = 0;
for k = 0:floor(n/2),
    S = S + ((-1)^k)*(x^(n-2*k))/(factorial(k)*factorial(n-2*k)*(2^k));
end, 
value = S*factorial(n);
