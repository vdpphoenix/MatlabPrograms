% voice from microphone to the signal of MATLAB
n=10;
fs=16000; % sets n to be record time, sample rate is fs
channel = 1;
disp('Starting recording');
y = audiorecorder(n *fs,fs,channel); % Record
pause % Pause
wavplay(y,fs); % plays the voice of the record.
figure;
plot(y);
wavwrite(y,fs,Orivoice.wav); % Saves the file with name Orivoice.wav
pause;
[y,fs,bits]= wavread(Orivoice.wav);