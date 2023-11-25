% Design parameters
n = 3;               % Filter order
fc = 1000;           % Cutoff frequency in Hz

% Calculate normalized cutoff frequency (0.5 corresponds to Nyquist frequency)
Wn = fc / (fs/2);    % fs is the sampling frequency

% Design the Butterworth filter
[b, a] = butter(n, Wn, 'low');  % 'low' specifies a low-pass filter

% Display the coefficients
disp('Butterworth Filter Coefficients:')
disp('Numerator (b):');
disp(b);
disp('Denominator (a):');
disp(a);

% Frequency response plot
freqz(b, a, 1024, fs);  % fs is the sampling frequency
title('Frequency Response of Butterworth Filter');
