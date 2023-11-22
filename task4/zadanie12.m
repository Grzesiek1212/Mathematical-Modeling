function zadanie12()
    L = 0.5*1e-3;
    C = 0.1*1e-9;
    R = 1*1e3;
    tspan = [0,5*1e-6];
    syms t
    syms q(t)


    V(t) = 1 - exp(-1e7 * t); % Napięcie źródła
    
    % Definicja równania różniczkowego
    eqn = L * diff(q, t, t) + R * diff(q, t) + (1/C) * q == V(t);
    
    % Warunki początkowe
    q0 = q(0) == 0;
    dq0 = subs(diff(q, t), t, 0) == 0;
    
    % Rozwiązanie równania
    sol = dsolve(eqn, [q0, dq0]);
    
    % Wyświetlenie rozwiązania
    uct = sol/C;
    urt = R*diff(sol);

   hold on
   fplot(uct,tspan);
   fplot(urt,tspan);
   hold off

