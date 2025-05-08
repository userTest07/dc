
clc;
close all;
% M-ary QAM Simulation in Octave
% Parameters
M = 16; % M-ary QAM (Change to desired M value, e.g., 4, 16, 64, etc.)
num_symbols = 1000; % Number of QAM symbols to transmit
EbNodB= 20; % Signal-to-Noise Ratio in dB
% Generate random data symbols (integer values from 0 to M-1)
data_symbols = randi([0, M-1], 1, num_symbols);
% QAM Modulation
Tx_symbol = qammod(data_symbols, M);
% Constellation Diagram of the Tx symbols
scatterplot(Tx_symbol); grid minor;
plot(real(Tx_symbol),imag(Tx_symbol),'r*');
title('Constellation Diagram of 16-QAM for Transmitted Symbol');
xlabel('Inphase component');
ylabel('Quadrature component');
grid on;
%AWGN for Constellation points
Rx_symbols = awgn(Tx_symbol,EbNodB,'measured');
% Constellation Diagram of the Rx symbols
scatterplot(Rx_symbols); grid minor;
plot(real(Rx_symbols),imag(Rx_symbols),'b*');
title('Constellation Diagram of 16-QAM for Receiveded Symbol');
xlabel('Inphase component');
ylabel('Quadrature component');
grid on;
%dataIn = randi([0 1],n*k,1); % Generate vector of binary data
SNRdB=0:1:50;
SNR=10.^log(SNRdB/10);
index=1;
%m = 2:2:6;
%M=2.^m;
figure(3);
for i=M,
k=log2(i);
BER=2/k*(1-1/sqrt(i))*erfc(sqrt(3*SNR*k/(2*(i-1))));%Calculate BER for QAM
plotHandle=plot(SNRdB, log10(BER),'b*');
index=index+1;
end
title('SNR per bit (Eb/N0) Vs BER Curve for 16-QAM Modulation Scheme');
xlabel('SNR per bit (Eb/N0) in dB');
ylabel('Bit Error Rate (BER) in dB');
grid on;
