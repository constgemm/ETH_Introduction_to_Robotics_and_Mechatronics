%% Lab 07

%%%%%%%%%%%%%%%%%%%%
% global variables %
%%%%%%%%%%%%%%%%%%%%

%create time variable, goes from 0 to 5 sec in 0.0001 steps
TIMESTEP=0.0001;
t=0:TIMESTEP:5;

%%%%%%%%%%%%%
% Prelab Q1 %
%%%%%%%%%%%%%

% Differential Equatoin of the sytem: x''(t) = 30/5*beta (t)
% create the transfer function of the system (you should use the tf() function):


numerator=[30];
denominator =[5 0 0]; 
sys = tf(numerator, denominator);


% set step options to have a step-size of 0.1 instead of 1 (standard), use
% stepDataOptions()

opt = stepDataOptions('StepAmplitude', 0.1);

subplot(2,1,1);
impulse(sys);
subplot(2,1,2);
step(sys, opt);

% open loop impulse and step response in one figure (two subplots):




%%%%%%%%%%%%%
% Prelab Q2 %
%%%%%%%%%%%%%

% Controller Parameters:

Kp=20;
Ki=1;
Kd=2;
Kd_=20;


% create the transfer function of the Controller:


% create the transfer function of the feedback loop


% Plot the closed loop step response



%%%%%%%%%%%%%
% Prelab Q3 %
%%%%%%%%%%%%%

% controller constants:

%Kp=?;
%Ki=?;
%Kd=?;

% create the transfer function of the Controller 


% Variables for delay:
DELAY=0.08; % 80ms
DELAY_=0.3; % 300ms

% create the transfer function of the delay in the system


% create the transfer function of the feedback loop with delay


% Plot the closed loop step response of the system with delay


% check design criteria for "steady state" error at 5 seconds


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









