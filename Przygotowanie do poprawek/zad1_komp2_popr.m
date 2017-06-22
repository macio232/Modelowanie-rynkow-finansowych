K=105;
N=40000;
S0=100;
S=100*ones(N,1);
T=5;
mu=0.02;
sigma=0.1;
Z_all=randn(N,T);
%podpunkt a
for i=1:T
    Z=Z_all(:,i);
    S=S.*exp((mu-sigma^2/2)*1/12+sigma*(1/12)^0.5*Z);
end
payoff=max(S-K,0)*exp(-T/12*mu);
mean(payoff)
%podpunkt b
S1=100*ones(N,1);
S2=100*ones(N,1);
for i=1:T
    Z=Z_all(:,i);
    S1=S1.*exp((mu-sigma^2/2)*1/12+sigma*(1/12)^0.5*Z);
    Z=-Z;
    S2=S2.*exp((mu-sigma^2/2)*1/12+sigma*(1/12)^0.5*Z);
end    
payoff1=max(S1-K,0)*exp(-T/12*mu);
payoff2=max(S2-K,0)*exp(-T/12*mu);
payoff=(payoff1+payoff2)/2;
mean(payoff)

d_minus=(log(S0/K)+(mu-sigma^2/2)*T/12)/(sigma*sqrt(T/12));
d_plus=(log(S0/K)+(mu+sigma^2/2)*T/12)/(sigma*sqrt(T/12));
BS=S0*cdf('norm',d_plus,0,1)-K*exp(-mu*T/15)*cdf('norm',d_minus,0,1)
    
