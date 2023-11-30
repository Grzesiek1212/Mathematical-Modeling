function plotuj(t_values, y_values)
% Autor: Grzegorz Prasek
% Funkcja pomocnicza przedsawiajająca uzyskane wartości na wykresie

figure;
plot(t_values, y_values(:, 1), 'r', 'LineWidth', 2, 'DisplayName','funkcja y1(t)');
hold on;
plot(t_values, y_values(:, 2), 'b', 'LineWidth', 2, 'DisplayName','funkcja y2(t)');
xlabel('czas');
legend('y1(t)', 'y2(t)');
ylabel('Wartości');
title('Rozwiązanie układu równań różniczkowych');
legend('show');
grid on;
end