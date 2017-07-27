clc;                        
clear;
[data fs]=audioread('aA@u.mp3');
 data=data(27350:30600);
len = length(data);
x=0;
beats=0;
for i = 2 : len-1
    if (data(i,1) > data(i-1,1) & data(i,1) > data(i+1,1))
  
       if(data(i,1)>beats)
           beats=data(i,1);
           x=i;
       end
    end
end
data=data(x:len);
len = length(data);
r=input('Enter the value of r\n');
l1=(r*len);                               %finding length of new array
data1 = zeros(ceil(l1),1);
if(r>1) % for_stretching
       data1(1,1)=data(1,1);
       
        for i=2:len
           
            if(ceil(r*i)==(r*i))
               data1(r*i,1)=data(i,1);
            end
            
             if(ceil(r*i)~=(r*i))
               data1(ceil(r*i),1)=data(i,1);
             end
             
        end
        u=ceil(r);
        for i=2:u
            m=(data1(2,1)-data(1,1))/(u-1);
            data1(i,1)=data(1,1)+(m*(i-1));
        end
        
        for i=2: len
              x1=ceil(r*(i-1));
              x3=ceil(r*i)-x1;
              
              if x3>0
                  
              y1=data1(x1,1);
              y2=data1(ceil(r*i),1);
               m=(y2-y1)/x3;
              
                     for j=x1+1:ceil(r*i)-1
                        data1(j,1)=y1+(m*(j-x1));
                     end
              end
        end
end 

if(r==1)
    [data1 fs]=audioread('Ba.wav'); % for_same_signaL
end

if (r<1)  %for_compressioN
         data1(1,1)=data(1,1);
         for i=1:ceil(l1)
             x1=ceil(i/r);
             if(x1<len)
               data1(i,1)=data(x1,1);
             end
         end
end
subplot(2,1,1)
plot(data)
subplot(2,1,2)
plot(data1)