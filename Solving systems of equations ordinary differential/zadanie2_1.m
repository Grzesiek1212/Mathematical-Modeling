function zadanie2_1()
% Autor: Grzegorz Prasek
% Funkcja pomocnicza reprezentująca metodę 2.1

% Parametry równań różniczkowych
a = 19/3;
b = 8/3;
c = 8/3;
d = 1/3;

% Definicja równań różniczkowych
f = @(t, y) [-a*y(1) + b*y(2) + exp(-t)*sin(t); -c*y(1) + d*y(2) + exp(-t)*sin(t)];

% Warunki początkowe
y0 = [0; 0];

% Przedział czasowy
tspan = [0, 8];

% Rozwiązanie układu równań różniczkowych za pomocą ode45
[t, y] = ode45(f, tspan, y0);

% Wykres
figure;

plot(t, y(:, 1), 'r', 'LineWidth', 2, 'DisplayName', 'funkcja y1(t)');
hold on;
plot(t, y(:, 2), 'b', 'LineWidth', 2, 'DisplayName', 'funkcja y2(t)');
xlabel('Czas');
ylabel('Wartości');
title('Rozwiązanie układu równań różniczkowych');
legend('show');
grid on;