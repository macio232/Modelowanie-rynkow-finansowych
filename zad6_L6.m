function w = zad6_L6(S,K,T,r,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=500;
Z=randn(n,1);
S_T=S*exp((r-sigma^2/2)*T+sigma*T^0.5*Z);
payoff1=max(S_T-K,0)*exp(-r*T);
Z=-Z;
S_T=S*exp((r-sigma^2/2)*T+sigma*T^0.5*Z);
payoff2=max(S_T-K,0)*exp(-r*T);
payoff=(payoff1+payoff2)/2;
c=mean(payoff);
w=[c-1.96*std(payoff)/n^0.5 c+1.96*std(payoff)/n^0.5];
w(2)-w(1)
%Black-Scholes
d_plus=(log(S/K)+(r+sigma^2/2)*T)/sigma/sqrt(T);
d_minus=(log(S/K)+(r-sigma^2/2)*T)/sigma/sqrt(T);
C=S*cdf('Normal',d_plus,0,1)-K*exp(-r*T)*cdf('Normal',d_minus,0,1);
end

