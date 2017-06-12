K=105;
N=4000;
ST=100*ones(N,1);
T=5;
dt=1;
r=0.02;
mu=1.02;
sigma=0.1;
Z=randn(N,5);
for i=1:5
  ST=ST+mu*dt*ST+sigma*ST.*Z(:,i);  
end
payoff1=max(K-ST,0);
Z=-Z;
ST=100;
for i=1:5
  ST=ST+mu*dt*ST+sigma*ST.*Z(:,i);  
end
payoff2=max(K-ST,0);
payoff=(payoff1+payoff2)/2;
odp=mean(payoff)*exp(-mu*T/12)
d_plus=(log(S/K)+(r+sigma^2/2))/(sigma*sqrt(1/12));
d_minus=(log(S/K)+(r-sigma^2/2))/(sigma*sqrt(1/12));
BS=-S*icdf('Normal',-d_plus)+K*exp(-r*T/12)*icdf('Normal',-d_minus)
