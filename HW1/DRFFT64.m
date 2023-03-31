function [Re,I] = DRFFT64(x,y)
double z;
double X;
double X_inverse;
z = zeros(1,64);
X = zeros(1,64);
for n= 1:64
    z(n) = x(n)+y(n)*1i;
end
X = FFT64(z);
X_inverse = zeros(1,64);
X_inverse(1) = X(1);
for n= 2:64   
    X_inverse(n) =  X(66-n);
end
    Re = zeros(1,64);
    I = zeros(1,64);
for n = 1:64
    Re(n) = (X(n) + conj(X_inverse(n)))/2;
    I(n) = (X(n)- conj(X_inverse(n)))/2i;
end
end

