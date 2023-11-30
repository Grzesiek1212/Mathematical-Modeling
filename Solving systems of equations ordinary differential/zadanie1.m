function [y1_values, y2_values] =  zadanie1(dt)
% Autor: Grzegorz Prasek
% Funkcja pomocnicza reprezentująca zadanie 1

% Parametry równań różniczkowych
a = 19/3;
b = 8/3;
c = 8/3;
d = 1/3;

% Definicja równań różniczkowych
syms t y1(t) y2(t) x(t)
eq1 = diff(y1) == -a*y1 + b*y2 + x;
eq2 = diff(y2) == -c*y1 + d*y2 + x;

% Warunki początkowe
initialConditions = [y1(0) == 0, y2(0) == 0];

% Funkcja wymuszająca
x_t = exp(-t) * sin(t);

% Podstawienie x(t) do równań różniczkowych
eq1 = subs(eq1, x, x_t);
eq2 = subs(eq2, x, x_t);

% Rozwiązanie równań różniczkowych
sol = dsolve([eq1, eq2], initialConditions, 't');

% Wyświetlenie rozwiązań
y1_sol = sol.y1;
y2_sol = sol.y2;
h = dt;
% Rysowanie wykresów
t_values = 0:h:8;
y1_values = double(subs(y1_sol, t, t_values));
y2_values = double(subs(y2_sol, t, t_values));