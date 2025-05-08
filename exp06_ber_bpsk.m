clear;
clc;
N=1000000;
R=1;
EbN0dB = -5:1:27;
data=randn(1,N)>=0;
   %Number of input bits
%Range of EbNo in dB for channel
   % Generating a uniformly distributed random 1s and 0s
bpskModulated = 2*data-1;  % Mapping 0->-1 and 1->1 i.e. Modulated Signal
BER = zeros(1,length(EbN0dB)); %Place holder for BER values for each Eb/N0
index=1;
for k=EbN0dB,
%Adding noise with variance according to the required Eb/N0
EbN0 = 10.^(k/10); %Converting Eb/N0 dB value to linear scale
noiseSigma = sqrt(1./(2*R*EbN0)); %Standard deviation for AWGN Noise
noise = noiseSigma*randn(1,length(bpskModulated));
received = bpskModulated + noise;
estimatedBits=(received>=0);
BER(index) = sum(xor(data,estimatedBits))/length(data);
index=index+1;
end
plotHandle=plot(EbN0dB,log10(BER),'r*');
set(plotHandle,'LineWidth',1.5);
title('SNR per bit (Eb/N0) Vs BER Curve for BPSK Modulation Scheme');
xlabel('SNR per bit (Eb/N0) in dB');
ylabel('Bit Error Rate (BER) in dB');
grid on;
hold on;
3
for k=EbN0dB,
theoreticalBER = 0.5*erfc(sqrt(10.^(EbN0dB/10)));
end
plotHandle=plot(EbN0dB,log10(theoreticalBER),'k--');
set(plotHandle,'LineWidth',1);
legend('Simulated','Theoretical');
grid off;
hold off;
