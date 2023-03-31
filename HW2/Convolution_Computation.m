x = 3:3:96;
h_temp = 0:31;
h = zeros(1,32);
for i=1:32          
    h(i) = h_temp(33-i);
end
%%% Direct real convolution
conv_dir = zeros(1,63);
h_inv_32 = zeros(1,32);
for i=1:32          
    h_inv_32(i) = h(33-i);
end
h_inv = zeros(1,63);
h_inv(1:32) = h_inv_32;
x_N = zeros(1,63);
x_N(32:63) = x;
conv_temp = 0;
for n=1:63
    for k=1:63
        conv_temp = conv_temp+x_N(k)*h_inv(k);
    end
    conv_dir(n) = conv_temp;
    conv_temp = 0;
    h_inv = circshift(h_inv,1);
end
%%% DRFFT64 convolution
[X,H] = DRFFT64(x,h);
Conv_fft = zeros(1,64);
for i=1:64
    Conv_fft(i) = X(i)*H(i);
end
conv_fft = IFFT64(Conv_fft);
