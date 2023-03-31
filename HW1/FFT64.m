function [X] = FFT64(x)
x_odd = zeros(1,32);
x_even = zeros(1,32);
for n = 1:32
    x_odd(n) = x(2*n);
    x_even(n) = x(2*n-1);
end
xk_even = FFT32(x_even);
xk_odd = FFT32(x_odd);
for K = 1:32
     X(k) = xk_even(K) + exp(-1*1i*2*pi*(K-1)/64)*xk_odd(K);
     t = K+32;
     X(t) = xk_even(K) + exp(-1*1i*2*pi*(t-1)/64)*xk_odd(K);
end
end

