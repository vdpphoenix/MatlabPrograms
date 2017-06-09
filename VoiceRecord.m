% Initialisation

fs = 44100;    % Sampling rate in Hz
nBits = 16 ;     % Bits per sample
nChannels = 1;     % The number of channels: 1 (mono) or 2 (stereo)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Collect a sample of your speech with a microphone, and plot the signal data:

% Record your voice for 5 seconds.
recObj = audiorecorder(fs, nBits, nChannels); %audiorecorder object
n = str2double(input('Enter how many seconds you want to record ?\n','s')); % record time

record(recObj,n);    %recording
%recordblocking(recObj, n); %recording
if isrecording(recObj) == 1
    disp('Recording started');
end
disp('Start speaking.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% timer
t = timer('TimerFcn', 'stat=false; disp(''Timer!'')',... 
                 'StartDelay',n);
start(t)

stat=true;
while(stat==true)
  disp('.')
  pause(1)
end
delete(t) % Always delete timer objects after using them.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('End of Recording.');

% Play back the recording.
disp('Playing recording');
play(recObj);

% Store data in double-precision array.
y = getaudiodata(recObj);

% Plot the waveform.

plot(y);
xlabel('time');
ylabel('amplitudes');

% writing into a file 
temp = input('Do you want to save this audio to a file ?\n','s');
if temp == 'y'
    filename = input('Enter filename alongwith format\n','s');
    audiowrite(filename,y,fs);
    sprintf('Audio saved as %s',filename);
    clear y fs
end
