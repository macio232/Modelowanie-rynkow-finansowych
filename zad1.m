function w = zad1(S,K,T,r,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=1000;
Z=randn(n,1);
S_T=S;
for i=1:5
    Z=randn(n,1);
    S_T=S_T.*exp((r-sigma^2/2)*1/12+sigma*(1/12)^0.5*Z);
end
payoff=max(S_T-K,0)*exp(-r*T/12);
c=mean(payoff);
w=[c-1.96*std(payoff)/n^0.5 c+1.96*std(payoff)/n^0.5];
%Black-Scholes
d_plus=(log(S/K)+(r+sigma^2/2)*T/12)/sigma/sqrt(T/12)
d_minus=(log(S/K)+(r-sigma^2/2)*T/12)/sigma/sqrt(T/12)
C=S*cdf('Normal',d_plus,0,1)-K*exp(-r*T/12)*cdf('Normal',d_minus,0,1)
end

