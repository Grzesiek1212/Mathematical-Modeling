function pom()
dt = 0.001;
tpsan = [0,1];
y0 = 1;
t = tspan(1):dt:tspan(2);
N = length(t);
y = zeros(N,1);
y(1) = y0;
for(n = 2:N)
        y(n) = y(n-1)+dt*4*y(n-1);
end
