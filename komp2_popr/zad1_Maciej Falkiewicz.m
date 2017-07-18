%podpunkt a)
K=95;
N=4000;
S0=100;
S=S0*ones(N,1);
T=5;
r=0.02;
sigma=0.1;
for i=1:T
    Z=randn(N,1);
    S=S.*exp((r-sigma^2/2)*(1/12)+sigma*(1/12)^0.5*Z);
end
payoff=max(S-K,0)*exp(-r*T/12);
odp=mean(payoff)
%podpunkt b)
w=[-icdf('norm',1-0.05/2)*std(payoff)/sqrt(N)+mean(payoff) icdf('norm',1-0.05/2)*std(payoff)/sqrt(N)+mean(payoff)];
w(2)-w(1)