function zadanie1c(a,r,N)
% 3 wariant
    tic
    X = zeros(1,N);
    X(1,1) = a;
    for i = 2:N
        X(1,i) = X(1,i-1)*r;  
    end
    %disp(X);
    toc