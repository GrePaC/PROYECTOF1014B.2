%REALIZADO POR>
%Alberto Navarrete A01442954
%Jemuel Flores A01367182
%Grecia Pacheco A01366730
%Oscar Reyes A01369421
%MAIN
t=[0:1:20];
m=800;
g=9.81;
e=2.718;
Fg=m*g;
k=[1100];
v=[];
v1=[];

for i=2:length(t)
    k(i)=k(i-1)+60;
end

%Velocidad
for i=1:length(t)
   x=-k(i)*t(i)/m;
   v1(i)=(Fg/k(i)).*(1-e^x);
   
end
%altura
for i=1:length(t)
    x=-(k(i)*t(i))/m;
    term1= Fg/k(i);
    term2=e^x;
    term3=term2-1;
    term4=m/k(i);
    term4=(t(i)+term4.*term3);
    h2(i)=67-(term1*term4);
    
end
%Aceleración
for i=1:length(t)
    x=-(k(i)*t(i))/m;
    v3(i)=(((e^x).*Fg)/m)
    
end



subplot(3,2,1),plot(t,v1);
title('Velocidad vs tiempo');
xlabel('Tiempo');
ylabel('Velocidad');

subplot(3,2,2),plot(h2,v1);
title('Velocidad vs Altura');
xlabel('Altura');
ylabel('Velocidad');

subplot(3,2,3),plot(t,v3);
title('Aceleración vs tiempo');
xlabel('tiempo');
ylabel('Aceleración');

subplot(3,2,4),plot(h2,v3);
title('Aceleración vs Altura');
xlabel('Altura');
ylabel('Aceleración');