S=100;
K=102;
T=3;
r=0.05;
sigma=0.2;
u=exp(sigma*sqrt(1/12));
d=1/u;
q=(exp(r*1/12)-d)/(u-d);
drzewo=zeros(13,13);
drzewo(1,:)=[1 cumprod(u*ones(1,12))];
for i=1:12
    drzewo(i+1,i+1:13)=drzewo(i,i+1:13)/u^2;
end
%podpunkt a)
drzewo_opcja_a=zeros(12,12);
drzewo_opcja_a(:,12)=max(drzewo(1:12,12)*S-K,0);
for i=flip(1:11)
    for j=1:i
        drzewo_opcja_a(i,j)=exp(-r*T/12/11)*(q*drzewo_opcja_a(i+1,j)+(1-q)*drzewo_opcja_a(i+1,j+1));
    end
end    