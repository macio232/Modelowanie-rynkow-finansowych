T=50;
r=0.05;
sigma=0.2;
S=100;
N=1;
dt=1;
dB=randn(N,T);
X=S*ones(N,1);
Z=S*ones(N,1);
K=100;
for i=2:T+1
    X(:,i)=X(:,i-1)+r*X(:,i-1)*dt/12+sigma*X(:,i-1).*dB(:,i-1);
    Z(:,i)=Z(:,i-1).*exp((r-sigma^2/2)*dt/12+sigma*(dt/12)^0.5*dB(:,i-1));
end
plot(X,'red')
hold on
plot(Z)