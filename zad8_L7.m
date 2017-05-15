function [ output_args ] = zad8_L7( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dt=T/N;
u=exp(sig*dt^0.5);
disc=exp(-r*dt);
q=(exp(r*dt)-d)/(n-d);
S=zeros(N+1,N+1);
X=S;
S(1,:)=S0*cumprod([1 u*ones(1,N)]);
for i=2:N+1
    S(i,i:N+1)=S(i-1,i:N+1)/u^2;
end

