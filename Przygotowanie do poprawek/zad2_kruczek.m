clear all
K=100;
T=12;
r=0.05;
sigma=0.1;
S0=100;
n=20;
dt=T/12/n;
u=exp(sigma*sqrt(dt));
q=(exp(r*dt)-1/u)/(u-1/u);
kroki=S0*[1 cumprod(u*ones(1,n))];
for i=2:n+1
    kroki(i,i:end)=kroki(i-1,i:end)/u^2;
end
payoff=zeros(n+1,n+1);
payoff(:,n+1)=max(kroki(:,n+1)-K,0);
for j=flip(1:n)
    for i=1:j
        payoff(i,j)=exp(-r*dt)*(q*payoff(i,j+1) + (1-q)*payoff(i+1,j+1));
    end
end
payoff(1,1)
d_minus=(log(S0/K)+(r-sigma^2/2)*T/12)/(sigma*sqrt(T/12));
d_plus=(log(S0/K)+(r+sigma^2/2)*T/12)/(sigma*sqrt(T/12));
BS=S0*cdf('norm',d_plus,0,1)-K*exp(-r*T/12)*cdf('norm',d_minus,0,1)
