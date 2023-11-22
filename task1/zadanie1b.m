function zadanie1b(a,r,N)
% 2 wariant
    tic
    B = ones(1,N)*a;
    D = ones(1,N)*r;
    B = B.*(D.^(0:N-1));
    %disp(B);
    toc