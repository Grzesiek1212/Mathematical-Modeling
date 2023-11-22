function zadanie2()
    Q = 2;
    p = 1.06;
    n = 0.053;
    Y0 = 1.2 * 10^5;
    tspan = [0,5];
    z = 0:0.01:4.99;
  
    
   dz1 = @(z,y) (-(4.*Q^2).*p)./(3.*A(z)) .* ((A(z+0.001) - A(z-0.001))./0.002) - (8*pi * n * Q )./ ((A(z)).^2);
   
   dz2 = @(z,y) (-(4.*Q^2).*p)./(3.*A2(z)) .* ((A2(z+0.001) - A2(z-0.001))./0.002) - (8*pi * n * Q )./ ((A2(z)).^2);
   
   [t_ode,y] = ode45(dz1,tspan,Y0);
   [t_ode2,y2] = ode45(dz2,tspan,Y0);

   hold on
   plot(t_ode,y);
   plot(t_ode2,y2);
   hold off

function wynik =  A(x)
    wynik = zeros(1,length(x));
    wynik(x < 0.3*5 | x > 0.7*5) = 0.2;
    wynik(x >= 0.3*5 & x <= 0.7*5) = 0.7*0.2;
    

function wynik =  A2(x)
    wynik = zeros(1,length(x));
    wynik(x < 0.3*5 | x > 0.7*5) = 0.2;
    wynik(x >= 0.3*5 & x <= 0.7*5) = 0.2*0.2;
    