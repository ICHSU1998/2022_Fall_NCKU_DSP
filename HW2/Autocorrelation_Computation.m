X = [-1	2	-3	4	-5	6	-7	8	-9	10	-11	12	-13	14	-15	16	-17	18	-19	20	-21	22	-23	24	-25	26	-27	28	-29	30	-31	32	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0]
x_inv = [32 -31	30	-29	28	-27	26	-25	24	-23	22	-21	20	-19	18	 -17	16	-15	14	-13	12	-11	10	-9	8	-7	6	-5	4	-3	2	 -1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0]
x = zeros(1,32);
for n=1:32
    x(n) = n*(-1).^n;
end
%%% Direct real autocorrelation
R = zeros(1,63);
auto_dir = zeros(1,63);
x_shift = zeros(1,63);
x_shift(1:32) = x;
x_padd = zeros(1,63);
x_padd(32:63) = x;
auto_temp = 0;
for n=1:63
    for k=1:63
        auto_temp = auto_temp+x_shift(k)*x_padd(k);
    end
    auto_dir(n) = auto_temp;
    auto_temp = 0;
    x_shift = circshift(x_shift,1);
end
%%% DRFFT64  Autocorrelation
x_inv=zeros(1,32);
for i=1:32          
    x_inv(i)=x(33-i);
end
[X,X_inv]=DRFFT64(x,x_inv);
Auto_fft=zeros(1,64);
for i=1:64
    Auto_fft(i)=X(i)*X_inv(i);
end
auto_fft=IFFT64(Auto_fft);