clear all;
S0=100;
K=102;
r=.05;
sigma=.2;
n=10000;   %iloœæ kroków - parametr do zmiany
T=3/12;
dt=T/n;
u=exp(sqrt(dt)*sigma);
q=(exp(r*dt)-1/u)/(u-1/u);
dyskonto=exp(-r*dt);
kroki=S0*[1 cumprod(u*ones(1,n))];
for i=2:n+1
    kroki(i,i:end)=kroki(i-1,i:end)/u^2;
end
wyplata=zeros(n+1,n+1);
wyplata(:,end)=max(kroki(:,end)-K,0);
for j=flip(1:n)
    for i=1:j
        wyplata(i,j)=dyskonto*(q*wyplata(i,j+1)+(1-q)*wyplata(i+1,j+1));
    end
end
wyplata(1,1)

d_plus=(log(S/K)+(r+sigma^2/2)*dt)/(sigma*sqrt(dt))
d_minus=(log(S/K)+(r-sigma^2/2)*dt)/(sigma*sqrt(dt))
Scholes1=-S*icdf('Normal',-d_plus,0,1)+K*exp(-r*dt)*icdf('Normal',-d_minus,0,1)
