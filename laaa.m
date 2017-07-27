clc;
clear;
[data fs]=audioread('aA@u.mp3');
l=audioread('L.mp3');
aa=data(12000:18500);
la=l(16000:28000);
 aa=1.5*aa;
% h=0.75*length(la);
%h=ceil(h);
subplot(3,1,1);
plot(la);
subplot(3,1,2);
plot(aa);
h=0;
len=length(aa);
peak=0;
peaki=0;
for i=2:len
    if(aa(i,1)>aa(i-1,1) & aa(i,1)> aa(i+1,1) & aa(i,1) >= peak)
        peak=aa(i,1);
        peaki=i;
    end
end
aa=aa(peaki:len);
for i=floor(length(la)/2):length(la)
    if(la(i,1)>(peak-0.2) & la(i,1)<(peak+0.2))
       h=i;
       break;
    end
end
la=la(1:h);
laa=vertcat(la,aa);
sound(laa,34100);


subplot(3,1,3);
plot(laa);