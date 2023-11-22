function zadanie3()
load("MM_23Z_L2.mat");
X = series(feedback(series(T2,T3),T4),T1);
figure
step(X);
figure
impulse(X);