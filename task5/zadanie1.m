function zadanie1()
    dt = 0.001;
    t = 0:dt:30;
    N = length(t);
    przyspie = zeros(N,1);
    predkosc = zeros(N,1);
    polozenie = zeros(N,1);
    polozenie(1) = 0;
    predkosc(1) = 22.2;
    for n = 2:N
        if t(n)<= 2
            przyspie(n) = 0;
        end
        if t(n) > 2 && t(n) < 4
            przyspie(n) = -1.1;
        end
        if t(n) >=4 && t(n) < 5
            przyspie(n) = 0;
        end

        if t(n) >= 5 && t(n) < 7
            przyspie(n) = 1.1;
        end

        if t(n) > 7
            przyspie(n) = 0;
        end
        predkosc(n) = predkosc(n-1) + dt*przyspie(n-1);
        polozenie(n) = polozenie(n-1) + dt*predkosc(n-1);
    end

figure(1)
plot(t,przyspie);
figure(2)
plot(t,polozenie);
figure(3)
plot(t,predkosc);



