function pomoc()
    syms a t f(t)
    tspan = [0,5];
    y0 = 15;
    df = diff(f);
    eq = df == a*f;
    ic = f(0) == y0;
    sol = dsolve(eq,ic);
    sol_subs = subs(sol,a,0.5);
    fplot(sol_subs, tspan)
    %%%%%%%% metoda ode45

    dy = @(t,y) 0.5*y;
    [t_ode, y] = ode45(dy,tspan,y0);
    
    plot(t_ode,y,'o')