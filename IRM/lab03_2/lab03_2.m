clear;
close all;
newplot;
% How long is the sample kernel? - Q1
M = 200;
% What is the cut-off frequency? - Q1
fc = 0.1;
% This function builds a Blackman filter kernel
% with cut-off frequency fc.
blk = fir1(M,fc, blackman(M+1));
% We also want a moving average filter
% It can be of different lenghts than the Blackman
N = 100;
% This will not be as long as the Blackman filter
% So we have to pad the rest of the vector with 0s
avg = [zeros(M/2-N+1,1) ; ones(N,1)./N ; zeros(M/2,1)];
% We’d like to plot multiple times on the same graph to show filter
% kernels:
hold on;
plot(blk,'-b');
xlabel('sample number')
ylabel('Amplitude')
plot(avg,'.-r');
legend('Blackman','Moving Average');
% This is the filter visualization tool: go on
% Analysis->Analysisparemters and change Magnitude Display from
% "Magnitude(dB)" to "Magnitude" to have a linear scale.
fvtool(blk,1,avg,1);
legend('Blackman','Moving Average');