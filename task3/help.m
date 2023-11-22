function help()

    %syms x y; 

    y = dsolve('D2x + 2*Dx + 4*x=0' , 'x(0)=0' , 'Dx(0)=-1'); % równanie wraz z

    % warunkami początkowymi

    pretty(y); % wypisanie rozwiązania

    t=0:0.01:9.99; 

    w=subs(y); % wartość liczbowa ‘y’ wyliczona poprzez podstawienie

    % zdefiniowanego wcześniej wektora ‘t’

    plot(t,w,'r-'); 
    xlabel('czas[s]');
    ylabel('amplituda sygnalu');
    title('Wykres rozwiazania rownania rozniczkowego');

    grid;