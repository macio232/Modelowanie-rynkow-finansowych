T=5;
r=0.05;
sigma=0.2;
S=100;
N=1000;
dt=1;
dB=randn(N,T);
X=S*ones(N,1);
K=100;
for i=2:T+1
    %X(:,i)=X(:,i-1)+r*X(:,i-1)*dt/12+sigma*X(:,i-1).*dB(:,i-1);
    X(:,i)=X(:,i-1).*exp((r-sigma^2/2)*dt/12+sigma*(dt/12)^0.5*dB(:,i-1));
end
F=max(X(:,T+1)-K,0)*exp(-r*T/12);
CALL_MC=mean(F)
d_minus=(log(S/K)+(r-sigma^2/2)*T/12)/(sigma*sqrt(T/12));
d_plus=(log(S/K)+(r+sigma^2/2)*T/12)/(sigma*sqrt(T/12));
CALL_BS=S*cdf('normal',d_plus,0,1)-K*exp(-r*T/12)*cdf('normal',d_minus,0,1)