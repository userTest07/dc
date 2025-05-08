clc;
clear all;
num_sample=1000; %Number of samples in the random signal
frequency=5; %Frequency of sinusoidal signal in HZ
amplitude=1.0; % Amplitude of sinusoidal signal in HZ
%phase=rand()*2*pi;
t=linspace(0,1,num_sample);
for k=1:4;
phase=rand()*2*pi;
random_signal= amplitude*sin(2*pi*frequency*t+phase);
plot(t, random_signal);
hold all;
end
hold off;
title("Random Sinusoidal Signal");
xlabel('Time(second)');
ylabel('Amplitude');
grid on;
mean_signal=mean(random_signal);
var_signal = var(random_signal);
% Display the results
disp(['Mean of the random process: ', num2str(mean_signal)]);
disp(['Variance of the random process: ', num2str(var_signal)]);
