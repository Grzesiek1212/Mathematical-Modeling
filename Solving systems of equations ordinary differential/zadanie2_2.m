function y_values = zadanie2_2(dt)
% Autor: Grzegorz Prasek
% Funkcja pomocnicza reprezentująca metodę 2.2

% Definicja układu równań różniczkowych
x = @(t) exp(-t) * sin(t);
A = [-19/3,8/3;-8/3,1/3];
B = [1;1];
f = @(t, y) ( A*y + B*x(t) );

% Warunki początkowe
initial_conditions = [0; 0];

% Przedział czasu
tspan = [0 8];

% Krok czasowy
h = dt;

% Inicjalizacja wektorów wynikowych
t = tspan(1):h:tspan(2);
y_values = zeros(2,length(t));
y_values(:,1)= initial_conditions';

% Implementacja metody 2
for i = 3:length(t)
    f1 = f(t(i-1), y_values(:, i-1));
    f2 = f(t(i-2), y_values(:, i-2));

    y_values(:, i) = y_values(:, i-1) + h/2*( 3*f1 - f2 );
end
y_values = y_values';