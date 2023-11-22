function zadanie2()
    alfa1 = 1;
    beta1 = 2;
    alfa2 = 0.1;
    beta2 = 0.2;
    x1 = @(t) sin(t);
    x2 = @(t) cos(2*t);
    t = 0:0.01*pi():2*pi();

    x3a = f2(f1(alfa1*x1(t)+beta1*x2(t)));
    x4a = alfa1*f2(f1(x1(t)))+ beta1*f2(f1(x2(t)));
    
    x3b = f2(f1(alfa2*x1(t)+(beta2*x2(t))));
    x4b = alfa2*f2(f1(x1(t)))+ beta2*f2(f1(x2(t)));

    x5a = f2(alfa1*x1(t)+(beta1*x2(t))) + f1(alfa1*x1(t)+(beta1*x2(t)));
    x6a = alfa1*f2(x1(t))+ beta1*f2(x2(t))+ alfa1*f1(x1(t))+ beta1*f1(x2(t));
    
    x5b = f2(alfa2*x1(t)+(beta2*x2(t))) + f1(alfa2*x1(t)+(beta2*x2(t)));
    x6b = alfa2*f2(x1(t))+ beta2*f2(x2(t)) + alfa2*f1(x1(t))+ beta2*f1(x2(t));
    
    tiledlayout(2,2);

    nexttile
    hold on
    title("Szeregowe połaczenie podpunt A")
    plot(t,x3a)
    plot(t,x4a)
    hold off

    nexttile

    hold on
     title("Szeregowe połaczenie podpunt B")
    plot(t,x3b)
    plot(t,x4b)
    hold off

    nexttile
    hold on
     title("Równoległe połaczenie podpunt A")
    plot(t,x5a)
    plot(t,x6a)
    hold off

    nexttile
    hold on
    title("Równoległe połaczenie podpunt B")
    plot(t,x5b)
    plot(t,x6b)
    hold off