function [c] = IFFT64(x)
X = FFT64(x);
w = zeros(1,64);
c = zeros(1,64);
for n = 1:64
    w(n) = X(n)/64;
    t = 65-n;
end
for n = 1:64
    c(n) = w(65-n);
end
end
