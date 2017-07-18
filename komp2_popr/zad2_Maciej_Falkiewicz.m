clear all
%podpunkt a)
S=100;
K=108;
T=5;
n=12;
dt=T/12/n;
r=0.05;
sigma=0.2;
u=exp(sigma*sqrt(dt));
q=(exp(r*dt)-1/u)/(u-1/u);
kroki=S*[1 cumprod(u*ones(1,n))];
for i=2:n+1
    kroki(i,i:end)=kroki(i-1,i:end)/u^2;
end
payoff=zeros(n+1,n+1);
payoff_A=max(K-kroki,0);
payoff(:,n+1)=max(K-kroki(:,n+1),0);
for j=flip(1:n)
    for i=1:j
        payoff(i,j)=max(payoff_A(i,j),exp(-r*dt)*(q*payoff(i,j+1) + (1-q)*payoff(i+1,j+1)));
    end
end
odp=payoff(1,1)
%podpunkt b)
%Opcja jest przewartoœciowana, wiêc zajmujemy pozycjê krótk¹
%1)w chwili t=0
%-sprzedajemy opcjê
%-sprzedajemy fi(1) akcji
fi(1)=(payoff(1,2)-payoff(2,2))/(kroki(1,2)-kroki(2,2));
%-lokujemy theta(1) pieniêdzy po stopie r
theta(1)=8.5-fi(1)*100;
%2)w chwili t=1
fi(2)=(payoff(2,3)-payoff(3,3))/(kroki(2,3)-kroki(3,3))-fi(1);
%-sprzedajemy fi(2) akcji
%-lokujemy pieni¹dze po stopie r, nasze oszczêdnoœci wynosz¹ theta(2)
theta(2)=theta(1)*exp(r*dt)-(fi(2))*100/u

%kontynuujemy dopóki v=theta(t)-K<=0

