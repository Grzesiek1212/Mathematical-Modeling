% function zadanie2()
    
    dt = 0.001;
    t = 0:dt:30;
    N = length(t);
    przyspie1 = zeros(1,N);
    predkosc1 = zeros(1,N);
    polozenie1 = zeros(1,N);
    polozenie1(1) = 0;
    predkosc1(1) = 22.2;
    for n = 2:N
        if t(n)<= 2
            przyspie1(n) = 0;
        end
        if t(n) > 2 && t(n) < 4
            przyspie1(n) = -1.1;
        end
        if t(n) >=4 && t(n) < 5
            przyspie1(n) = 0;
        end

        if t(n) >= 5 && t(n) < 7
            przyspie1(n) = 1.1;
        end

        if t(n) > 7
            przyspie1(n) = 0;
        end
        predkosc1(n) = predkosc1(n-1) + dt*przyspie1(n-1);
        polozenie1(n) = polozenie1(n-1) + dt*predkosc1(n-1);
    end


    
    przyspie = zeros(6,N);
    predkosc = zeros(6,N);
    polozenie = zeros(6,N);
    
    przyspie(1,:) = przyspie1;
    predkosc(1,:) = predkosc1;
    polozenie(1,:) = polozenie1;
    polozenie(2,1) = 0;

    for i = 2:6
        polozenie(i,1) = polozenie(i-1,1)-8;
    end
    
    
    j = 1;
    while t(j)<=0.7
        for i = 2:6
            predkosc(i,j) = 22.2;
        end
        j = j+1;
    end
    
    %disp(predkosc(:,690:730))
    for i = 2:6
        for n = 701:N
            predkosc(i,n) = predkosc(i,n-1) + dt*przyspie(i,n-1);
            polozenie(i,n) = polozenie(i,n-1) + dt*predkosc(i,n-1);
            przyspie(i,n) = 0.3*predkosc(i,n)^0.5 * (predkosc(i-1,n-700) - predkosc(i,n-700))/(polozenie(i-1,n-700) - polozenie(i,n-700))^0.8;
        end
    end


hold on

plot(t,predkosc(1,:))
plot(t,predkosc(2,:))
plot(t,predkosc(3,:))
plot(t,predkosc(4,:))
plot(t,predkosc(5,:))
plot(t,predkosc(6,:))

hold off
