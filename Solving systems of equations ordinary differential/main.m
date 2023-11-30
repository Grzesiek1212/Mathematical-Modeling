function main()
% Autor: Grzegorz Prasek
% Uwaga: By uruchomić wszytskie zadania trzeba urchomić jedynie funkcje 
% main bez parametrów.
% funkcja ta zwraca wszystkie wykresy do wszystkich zadań.

% uruchoiemnie zadania 1 i zadania 2
[x_1,y_1] = zadanie1(0.01);
zad1 = [x_1',y_1'];

plotuj(0:0.01:8,zad1); 
zadanie2_1();
plotuj(0:0.01:8,zadanie2_2(0.01));
plotuj(0:0.01:8,zadanie2_3(0.01));
plotuj(0:0.01:8,zadanie2_4(0.01));

% zadanie 3
% zdefiniowanie przedziału
dt_min = 0.001;
dt_max = 1;
num_steps = 25;

blad1_m_2 = zeros(1,num_steps);
blad2_m_2 = zeros(1,num_steps);
blad1_m_3 = zeros(1,num_steps);
blad2_m_3 = zeros(1,num_steps);
blad1_m_4 = zeros(1,num_steps);
blad2_m_4 = zeros(1,num_steps);
osx = zeros(1,num_steps);

 for i = 1:num_steps
        dt = dt_min + (dt_max - dt_min) * (i - 1) / (num_steps - 1);
        osx(i) = dt;
        [zad1_1_values, zad1_2_values] = zadanie1(dt);
        zad2_3 = zadanie2_3(dt);
        zad2_2 = zadanie2_2(dt);
        zad2_4 = zadanie2_4(dt);
        blad1_m_2(i) = esytymat(zad1_1_values,zad2_2(:,1)');
        blad2_m_2(i) = esytymat(zad1_2_values,zad2_2(:,2)');
        blad1_m_3(i) = esytymat(zad1_1_values,zad2_3(:,1)');
        blad2_m_3(i) = esytymat(zad1_2_values,zad2_3(:,2)');
        blad1_m_4(i) = esytymat(zad1_1_values,zad2_4(:,1)');
        blad2_m_4(i) = esytymat(zad1_2_values,zad2_4(:,2)');
 end

 figure;

subplot(2, 1, 1);
loglog(osx, blad1_m_2, 'r', 'LineWidth', 1.5, 'DisplayName', 'metod2');
hold on;
loglog(osx, blad1_m_3, 'g', 'LineWidth', 1.5, 'DisplayName', 'metod3');
loglog(osx, blad1_m_4, 'b', 'LineWidth', 1.5, 'DisplayName', 'metod4');
xlabel('Wielkość h');
ylabel('Wartość błędu');
title('Wysokość błędu metod dla funkcji f_1 względem wielkość próbkowania ');
legend('show');
grid on;
hold off;

subplot(2, 1, 2);
loglog(osx, blad2_m_2, 'r', 'LineWidth', 1.5, 'DisplayName', 'metod2');
hold on;
loglog(osx, blad2_m_3, 'g','LineWidth',1.5, 'DisplayName', 'metod3');
loglog(osx, blad2_m_4, 'b', 'LineWidth',1.5, 'DisplayName', 'metod4');
xlabel('Wielkość h');
ylabel('Wartość błędu');
title('Wysokość błędu metod dla funkcji f_2 względem wielkość próbkowania ');
legend('show');
grid on;
hold off;

end

function wynik =  esytymat(solution1, solution2_numer)
   wynik = sum((solution2_numer - solution1).^2);
   wynik = wynik/sum(solution1.^2);
end