amp=0.9;
f=440;
fs=44100;
ts=1/fs;
t= 0:ts:(1-ts);
x = amp*sin(2*pi*f*t);
plot(t, x);
wavwrite(x, 2*fs, 'B.mp3');


[x2, fs2] = wavread('B.mp3','native');
x2 = double(x2);
x2 = x2*(1/32767);


sound(x2, fs*(440/220))
