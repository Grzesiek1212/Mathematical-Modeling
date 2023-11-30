function y = zadanie2_4(dt)
% Autor: Grzegorz Prasek
% Funkcja pomocnicza reprezentująca metodę 2.4

tspan = [0, 8];
y0 = [0, 0];
A = [-19/3,8/3;-8/3,1/3];
b = [ 1 ; 1];
x = @(t) ( exp(-t)*sin(t) ); 
h= dt;

% Inicjalizacja wektorów wynikowych
t = tspan(1):h:tspan(2);
y = zeros(2,length(t));
y(:, 1) = y0';

% Współczynniki Butchera
B = [1/6, 0, -1/6; 1/12, 5/12, 0; 1/2, 1/3, 1/6];
W = [1/6, 2/3, 1/6];
C = [ 0,  1/2, 1 ];

% Obliczanie lewej strony równań
L = [(eye(2)-h*B(1,1)*A),-h*B(1,2)*A, -h*B(1,3)*A;
    -h*B(2,1)*A,(eye(2)-h*B(2,2)*A), -h*B(2,3)*A;
    -h*B(3,1)*A,-h*B(3,2)*A, (eye(2)-h*B(3,3)*A);];

for i = 2:length(t)

    % Obliczanie prawej strony równań
    P = [A*y(:,i-1) + b*x(t(i-1) + C(1)*dt);
         A*y(:,i-1) + b*x(t(i-1) + C(2)*dt); 
         A*y(:,i-1) + b*x(t(i-1) + C(3)*dt)];
  
    % rozwiązywanie układu równań
    g = L \ P;
    % Obliczanie ostatecznej sumy
    fSum = W(1)*g([1 2]) + W(2)*g([3 4]) + W(3)*g([5 6]);
    y(:, i) = y(:, i-1) + dt*fSum;
end

y = y';