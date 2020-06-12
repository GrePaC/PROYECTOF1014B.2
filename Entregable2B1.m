%REALIZADO POR>
%Alberto Navarrete A01442954
%Jemuel Flores A01367182
%Grecia Pacheco A01366730
%Oscar Reyes A01369421
%MAIN

t=[0:1:10];
m=800;
g=9.81;
e=2.718;
Fg=m*g;
k=[1100];
v=[];
v1=[];
alti=67;
for i=2:length(t)
    k(i)=k(i-1)+60;
end

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
         x=-k(i)*t(i)/m;
         v1(i)=((-e^((-k(i)/m)*(t(i)-t0)))*(g-k(i)*v0)+g)/k(i);
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
disp(h2(i))
%Altura Frenado Magnético
for i=(r+2):length(t)
    x=((-k(i)*t(i))+t0*k(i))/m;
    term1= ((e.^x)-1);
    term2=m*(Fg-v1(i)*k(i));
    term3=(term1*term2)/(k(i).^2);
    term4=((Fg*t(i))/k(i));
    term5=(-Fg*t0)/(k(i));
    h2(i)=term3+term4+term5;
    
end

%Aceleración Caida Libre

for i=1:(r+1)
    v3(i)=9.81;
    
    
end
%Aceleración
for i=(r+1):length(t)
    x=-(k(i)*t(i))/m;
    v3(i)=(((e^x).*Fg)/m);
    
    
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

h3=h2(1:5);
t3=t(1:5);
subplot(3,2,5),plot(t3,h3);
title('Posición vs tiempo');
xlabel('Tiempo');
ylabel('Posición');