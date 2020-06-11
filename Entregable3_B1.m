%REALIZADO POR>
%Alberto Navarrete A01442954
%Jemuel Flores A01367182
%Grecia Pacheco A01366730
%Oscar Reyes A01369421
%MAIN
clc; clear all;
t=[0:1:10];
ra=2;
B=input("Escriba la magnitud del campo eléctrico: (Recomendado 25) ");
Res=input("Escriba la magnitud de la resistencia en Ohms: (Recomendado 40)");

m=800;
g=9.81;
e=2.718;
Fg=m*g;

k=((B.^2)*4*(pi.^2)*(ra.^2))/Res;
v=[];
v1=[];
alti=67;


%Velocidad
va=0;
i=1;
while va<19
    v1(i)=9.81*t(i);
    va=v1(i);
    i=i+1;
end
r=i-1;   
t0=t(i-1);
v0=va;
for i=r:length(t)
     if va>=0
         x=-k*t(i)/m;
         v1(i)=((-e^((-k/m)*(t(i)-t0)))*(g-k*v0)+g)/k;
         va=v1(i);
     end
    if va<0
        v1(i)=0;
    end

end
%Altura Caida Libre

for i=1:(r+1)
    h2(i)=alti-(0.5)*(g)*(t(i).^2);
    
end

%Altura Frenado Magnético
for i=(r+2):length(t)
    x=((-k*t(i))+t0*k)/m;
    term1= ((e.^x)-1);
    term2=m*(Fg-v1(i)*k);
    term3=(term1*term2)/(k.^2);
    term4=((Fg*t(i))/k);
    term5=(-Fg*t0)/(k);
    h2(i)=term3+term4+term5;
    
end

%Aceleración Caida Libre

for i=1:(r+1)
    v3(i)=9.81;
    
    
end
%Aceleración
for i=(r+1):length(t)
    x=-(k*t(i))/m;
    v3(i)=(((e^x).*Fg)/m);
    
    
end



subplot(3,2,1),plot(t,v1);
title('Velocidad vs tiempo');
xlabel('Tiempo');
ylabel('Velocidad');

subplot(3,2,2),plot(v1,h2);
title('Velocidad vs Altura');
ylabel('Altura');
xlabel('Velocidad');

subplot(3,2,3),plot(t,v3);
title('Aceleración vs tiempo');
xlabel('tiempo');
ylabel('Aceleración');

subplot(3,2,4),plot(v3,h2);
title('Aceleración vs Altura');
ylabel('Altura');
xlabel('Aceleración');