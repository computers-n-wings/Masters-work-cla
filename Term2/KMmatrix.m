clear;
format short;
L=5;
N=4;
n=N+1;
deltax=L/N;
x(1:n)=0:deltax:L;
for i=1:N
    A(i)=2-0.1*x(i);
    E(i)=4*exp(-0.2*x(i));
    rho(i)=3*exp(-0.3*x(i));
end
K=zeros(n);
M=zeros(n);
for i=1:N;
    K(i,i)=K(i,i)+E(i)*A(i)/deltax;
    K(i,i+1)=K(i,i+1)-E(i)*A(i)/deltax;
    K(i+1,i)=K(i+1,i)-E(i)*A(i)/deltax;
    K(i+1,i+1)=K(i+1,i+1)+E(i)*A(i)/deltax;
    M(i,i)=M(i,i)+rho(i)*A(i)*deltax/3;
    M(i+1,i)=M(i+1,i)+rho(i)*A(i)*deltax/6;
    M(i,i+1)=M(i,i+1)+rho(i)*A(i)*deltax/6;
    M(i+1,i+1)=M(i+1,i+1)+rho(i)*A(i)*deltax/3;
end

M = M((2:n),(2:n));
K = K((2:n),(2:n));

[V, D] = eig(K, M)




