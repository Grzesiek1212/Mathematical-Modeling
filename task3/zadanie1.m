function zadanie1()
    syms z P(z) A(z) A2(z);
    L = 5;
    Q = 2;
    p = 1.06;
    n = 0.053;
    tspan = [0,5];
   
    A(z) =  0.2*(1-0.3 + ((2*z - L)/L)^2*0.3);
    A2(z) =  0.2*(1-0.8 + ((2*z - L)/L)^2*0.8);

   eq = (4*Q^2)/3 * diff(1/A(z)) + A(z)/p * diff(P(z)) + (8*pi * n * Q )/ (p * A(z)) == 0;
   
   eq2 = (4*Q^2)/3 * diff(1/A2(z)) + A2(z)/p * diff(P(z)) + 8*pi * n *Q /( p * A2(z)) == 0;
   
   ic = P(0) == 1.2 * 10^5;
   
   sol = dsolve(eq,ic);
   sol2 = dsolve(eq2,ic);

   hold on
   fplot(sol,tspan);
   fplot(sol2,tspan);
   hold off
  