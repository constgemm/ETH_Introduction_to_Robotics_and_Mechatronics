%% Lab 07
close all
clear all
%%%%%%%%%%%%%%%%%%%%
% global variables %
%%%%%%%%%%%%%%%%%%%%

%create time variable, goes from 0 to 5 sec in 0.0001 steps
% TIMESTEP=0.0001;
% t=0:TIMESTEP:5;

%%
%%%%%%%%%%%%%
% Prelab Q1 %
%%%%%%%%%%%%%

% Differential Equatoin of the sytem: x''(t) = 30/5*beta (t)
% create the transfer function of the system (you should use the tf() function):
 
transBallDynamics = tf([30], [5 0 0]);

% set step options to have a step-size of 0.1 instead of 1 (standard), use
% stepDataOptions()

opt_StepAmplitude01 = stepDataOptions('StepAmplitude', 0.1);

% open loop impulse and step response in one figure (two subplots):

figure(1)
subplot(2,1,1)
impulse(transBallDynamics)
subplot(2,1,2)
step(transBallDynamics, opt_StepAmplitude01)

%%
%%%%%%%%%%%%%
% Prelab Q2 %
%%%%%%%%%%%%%

% Controller Parameters:

K_P = 20;
K_I = 1;
K_D = 2;
K_D_ = 20;


% create the transfer function of the Controller:
transPID_Controller = tf([K_D_ K_P K_I], [1 0]);
transForward = transPID_Controller * transBallDynamics;
% create the transfer function of the feedback loop

% trans_Q2_feedback = tf([6*K_D 6*K_P 6*K_I], [1 6*K_D 6*K_P 6*K_I]);
trans_Q2_feedback = feedback(transForward, 1);

% Plot the closed loop step response
figure(2)
step(trans_Q2_feedback, opt_StepAmplitude01)
% under damped using K_d = 2, and critically damped using K_d = 20;



%%
%%%%%%%%%%%%%
% Prelab Q3 %
%%%%%%%%%%%%%

% controller constants:
% 
% Kp = 20;
% Ki = 1;
% Kd = 2;
Kp = 0.2;
Ki = 0.1;
Kd = 2;

% create the transfer function of the Controller 
transPID_ControllerDelay = tf([Kd Kp Ki], [1 0]);


% Variables for delay:
DELAY=0.08; % 80ms
DELAY_=0.3; % 300ms

% create the transfer function of the delay in the system

% trans_Q3_delay = exp(-DELAY * s);
transDelay = tf(1, 1, 'InputDelay', DELAY);


% create the transfer function of the feedback loop with delay

transForwardDelay = transPID_ControllerDelay * transBallDynamics;
transFeedbackDelay = feedback(transForwardDelay, transDelay);

% Plot the closed loop step response of the system with delay

figure(3)
step(transFeedbackDelay, opt_StepAmplitude01)

% y_bot = 5;
% y_top = -5;
% time_bot = 4;
% time_top = 6;
% 
% axis([time_bot time_top y_bot y_top])
% check design criteria for "steady state" error at 5 seconds


%%
%%%%%%%%%%%%%
% Prelab Q4 %
%%%%%%%%%%%%%



% Hint: 
% - Make use of the linearized differential equations 
% - Filter out the first data points from the time delay to get rid of the
% incontinouity at the beginning of the sytem-response (otherwise the derivative explodes)
% - Make sure to use the right units (rad, degree, ...) --> check if your
%  values make sense if you are not sure. E.g. a free-falling ball
% has 9.81 m/s^2 acceleration







%% publish
%publish('prelab07.m','pdf')

