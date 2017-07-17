%  from a vowel signal cut base part , extend the timing by reapeating it many times
%  and shape it in an envelop
clc;
clear all;

a= audioread('aa.wav');
abase=a(1251:1303);      % base audio of a

[peaks locs]= findpeaks(a);     % peaks and corresponding location of signal a

first_peak_loc = locs(1,1);   
first_peak_val=peaks(1,1);

new_peak = [first_peak_val];
new_locs = [first_peak_loc];

%finding new peaks from old peaks having locs diff grtr than 10
for i=2:length(locs)
    if locs(i,1)-first_peak_loc >=11
        first_peak_loc = locs(i,1);
        new_peak = vertcat(new_peak,peaks(i,1));
        new_locs = vertcat(new_locs,locs(i,1));
    end
end


% plotting
subplot(321);
plot(a);
title('plotting aa.wav');

subplot(322);
plot(abase);
title('plotting abase');

subplot(323);
plot(locs,peaks);
title('plotting (locs,peaks)');

subplot(324);
plot(new_locs,new_peak);
title('plotting (new_locs,new_peaks)');


% making envelop of a
env = new_peak./max(new_peak);
anew = zeros(1000,1);
for i=1:length(env)
    anew = [anew ; abase*env(i,1)];
end

subplot(325);
plot(anew);
title('plotting anew');

sound(anew);



        