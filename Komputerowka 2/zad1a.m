K=105;
N=4000;
ST=100*ones(N,1);
T=5;
dt=1;
mu=1.02;
sigma=1.1;
Z=randn(N,5);
for i=1:5
  ST=ST+mu*dt*ST+sigma*ST.*Z(:,i);  
end
payoff=max(K-ST,0);
odp=mean(payoff)*exp(-mu*T/12)