N=10000;
K=85;
T=10;
H=100.5;
r=0.1;
sigma=0.4;
S0=100;
S=S0*ones(N,1);
for i=1:T
    Z=randn(N,1);
    S(:,i+1)=S(:,i).*exp((r-sigma^2/2)*1/12+sigma*(1/12)^0.5*Z);
end
payoff=max(S(:,T+1)-K,0);
payoff(sum(S>=H,2)==0)=0;
mean(payoff)*exp(-r*T/12)