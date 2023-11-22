function zadanie34()
    L = 0.5*1e-3;
    C = 0.1*1e-9;
    R = 1*1e3;
    tspan = [0 5*1e-6];
    e = @(t) 1 - exp(-1e7 * t);

    dzdt = @(t,z)[z(2);(-R*z(2) - 1/C * z(1) + e(t))/L];

    [t,Z] = ode45(dzdt,tspan,[0,0]);
     Z(:,1) = Z(:,1)*1/C;
     Z(:,2) = Z(:,2)*R;
    figure(1)
    plot(t,Z)
    