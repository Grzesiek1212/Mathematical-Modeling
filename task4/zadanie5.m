function zadanie5()
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

    tspan2 = [0 5*1e-6];
    e = @(t2) 1 - exp(-1e7 * t2);

    dzdt = @(t2,z)[z(2);(-R*z(2) - 1/C * z(1) + e(t2))/L];

    [t2,Z] = ode45(dzdt,tspan2,[0,0]);
    P = Z;
    P(:,1) = Z(:,1)*1/C;
    P(:,2) = Z(:,2)*R;

    DeltaQ = max(abs(double(subs(sol,t,t2)) - Z(:,2)))
    DeltaC = max(abs(double(subs(uct,t,t2)) - P(:,1)))
    DeltaR = max(abs(double(subs(urt,t,t2)) - P(:,2)))
    okrescmax= max(diff(t2))
    okrescmin= min(diff(t2))


   

     

    

