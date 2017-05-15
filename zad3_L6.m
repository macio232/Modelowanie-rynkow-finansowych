function w = zad3(S,K,T,r,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
j=[1 2 4 8 16 32 64 128]*10^3;
k=1;
for n=j
    Z=randn(n,1);
    S_T=S;
    for i=1:5
        Z=randn(n,1);
        S_T=S_T.*exp((r-sigma^2/2)*1/12+sigma*(1/12)^0.5*Z);
    end
    payoff=max(S_T-K,0)*exp(-r*T/12);
    c=mean(payoff);
    w(k,1)=c-1.96*std(payoff)/n^0.5;
    w(k,2)= c+1.96*std(payoff)/n^0.5;
    k=k+1;
end
%Black-Scholes
%d_plus=(log(S/K)+(r+sigma^2/2)*T/12)/sigma/sqrt(T/12)
%d_minus=(log(S/K)+(r-sigma^2/2)*T/12)/sigma/sqrt(T/12)
%C=S*cdf('Normal',d_plus,0,1)-K*exp(-r*T/12)*cdf('Normal',d_minus,0,1)
end

