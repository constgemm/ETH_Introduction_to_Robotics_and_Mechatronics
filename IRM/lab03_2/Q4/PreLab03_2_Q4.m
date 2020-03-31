clear all;
close all;
clc;

txt_file = dlmread('filtered_noisy_sinusoidN7.txt');
time = txt_file(:,1);
unfiltered = txt_file(:,2);
filtered = txt_file(:,3);
hold on
title('N=7')
xlabel('time[s]')
ylabel('signal')
plot(time,unfiltered);
plot(time,filtered);
legend('unfiltered signal', 'filtered signal')
hold off

