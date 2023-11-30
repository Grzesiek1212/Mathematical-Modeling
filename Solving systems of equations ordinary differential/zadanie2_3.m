function y_values = zadanie2_3(dt)
% Autor: Grzegorz Prasek
% Funkcja pomocnicza reprezentująca metodę 2.3

A = [-19/3,8/3;-8/3,1/3];
B = [1;1];
% Warunki początkowe
initial_conditions = [0; 0];
x_t = @(t) exp(-t) * sin(t);
ode_system = @(t, y) A*y + B*x_t(t);
% Przedział czasu
tspan = [0 8];

% Krok czasowy
h = dt;
s = h/12;

% Inicjalizacja wektorów wynikowych
t_values = tspan(1):h:tspan(2);
y_values = zeros(length(t_values), length(initial_conditions));
y_values(1,:)= initial_conditions';
y_values(2,:) = (eye(2)-h*A)\(y_values(1,:)'+h*B*x_t(t_values(2)));

% Implementacja metody 3
for n = 3:length(t_values)
    t_n = t_values(n);
    y_n_minus_1 = y_values(n-1, :)';
    y_n_minus_2 = y_values(n-2, :)';
    f_n_minus_1 = ode_system(t_n - h, y_n_minus_1);
    f_n_minus_2 = ode_system(t_n - 2*h, y_n_minus_2);

    % Wzór metody
    y_n = (eye(2) - 5*s*A)\(y_n_minus_1 + 5*s*B*x_t(t_n) + 8*s*f_n_minus_1 - s*f_n_minus_2);
    % Zapisanie wyniku
    y_values(n, :) = y_n';
end