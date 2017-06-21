clc;
clear;
[data fs] = audioread('B.mp3');
len=length(data);
r =input('Enter the value of r\n ');
data1 = zeros(len,1);
data1(1,1)=data(1,1);
for i=2 : len
    if (r*(i-1))<=len && floor(r*(i-1))==(r*(i-1))
       data1(i,1) = data(r*(i-1),1);
    end
    if ((r*(i-1))<=len && floor(r*(i-1))~=(r*(i-1)))
        x1=floor(r*(i-1));
        x2=ceil(r*(i-1));
        y1=data(x1);
        y2=data(x2);
        m=y2-y1;
        y3= y1+(m*((r*i)-x1));
        data1(i,1)=y3;
    end
end