a =1;
b = 2;
c = 3;
wektorpom = 
tspan = [0 10];
dzdt = @(t,z)[z(2);a*z(2)+ b*z(1)+c];
[t,Z] = ode45(dzdt, tspan,[8;17]);
figure(1)
plot(t,Z)
