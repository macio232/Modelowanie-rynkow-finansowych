function [C_mean, C_width] = zad4(S,K,T,r,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M=1000;
N=[1 2 4 8 16 32 64 128]*10^3;
Z=randn(N(end),M);
S_T=S*exp((r-sigma^2/2)*T+sigma*(T)^0.5*Z);
payoff=max(S_T-K,zeros(N(end),M))*exp(-r*T);
for m=1:M
    for i=1:length(N)
        n=N(i);
        C_mean(i,m)=mean(payoff(1:n,m));
        C_width(i,m)=2*1.96*std(payoff(1:n,m))/sqrt(n);
    end
end
figure()
boxplot(C_mean')
figure()
boxplot(C_width')
%Black-Scholes
%d_plus=(log(S/K)+(r+sigma^2/2)*T/12)/sigma/sqrt(T/12)
%d_minus=(log(S/K)+(r-sigma^2/2)*T/12)/sigma/sqrt(T/12)
%C=S*cdf('Normal',d_plus,0,1)-K*exp(-r*T/12)*cdf('Normal',d_minus,0,1)
end

