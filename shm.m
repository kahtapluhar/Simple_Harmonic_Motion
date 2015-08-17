% This function allows one to change the parameters of the 
% spring mass system and allows one to see the different 
% Displacement-Time, Velocity-Time and Acceleration-Time graphs
% that can be produced using the different parameters. 

d = 0.02; 
k = 2;
m = 0.386;

[t,y]=ode45(@(t,X) secondode(t,X,k,m,d),[0,100],[0.03,0]); 
 
%figure(3)
%data = csvread('3cm0cmSlack1.csv');
%z1_Gs = data(:, 3);
%z2_Gs = data(:, 6);

%acceleration= (1/m)*(-d*(y(:,2))+k*(y(:,1)));
%plot(t, acceleration);

%figure(4)
%plot(z1_Gs(1:1177));


%itle('Plotting dy2/d2t against time',... 
%  'FontWeight','bold')
%xlabel('Time (s)')
%hleg1 = legend('dy2/d2t');
%ylabel('Acceleration (ms^-2)');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Parameter Sweep of Mass

clear all
clc

k=0.2;
d=0.02;

for m=1:5
[t,y]=ode45(@(t,X) secondode(t,X,k,m,d),[0,500],[-0.02,0]); 

figure(1)
plot(t,y(:,1))
hold all
title('Parameter Sweep Mass [1:1:5].Plotting y(t) against time',... 
  'FontWeight','bold')
xlabel('Time')
hleg1 = legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
ylabel('y(t)')

figure(2)
plot(t,y(:,2))
hold all
title('Parameter Sweep Mass [1:1:5].Plotting dy/dt against time',... 
  'FontWeight','bold')
xlabel('Time (s)')
hleg1 = legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
ylabel('Velocity (ms^-1)')

figure(3)
acceleration= (1/m)*(-d*(y(:,2))+k*(y(:,1)));
plot(t, acceleration);
hold all
title('Parameter Sweep Mass [1:1:5].Plotting dy2/d2t against time',... 
  'FontWeight','bold')
xlabel('Time (s)')
hleg1 = legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
ylabel('Acceleration (ms^-2)')

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameter Sweep of k

clear all
clc

d=0.02; % to my system
m=0.386; % mass

for k=1:1:5 
    
[t,y]=ode45(@(t,X) secondode(t,X,k,m,d),[0,100],[-0.03,0]); %-0.02 disp change to 3cm 0.03

figure(1)
plot(t,y(:,1))
hold all
title('Parameter Sweep k [0.1:0.1:0.5].Plotting y(t) against time',... 
  'FontWeight','bold')
xlabel('Time (s)')
hleg1 = legend('k=1', 'k=2', 'k=3', 'k=4', 'k=5');
ylabel('y(t) m')

figure(2)
plot(t,y(:,2))
hold all
title('Parameter Sweep k [1:1:5].Plotting dy/dt against time',... 
  'FontWeight','bold')
xlabel('Time (s)')
hleg1 = legend('k=1', 'k=2', 'k=3', 'k=4', 'k=5');
ylabel('Velocity (ms^-1)')

figure(3)
acceleration= (1/m)*(-d*(y(:,2))+k*(y(:,1)));
plot(t, acceleration);
hold all
title('Parameter Sweep k [1:1:5].Plotting dy2/d2t against time',... 
  'FontWeight','bold')
xlabel('Time (s)')
hleg1 = legend('k=1', 'k=2', 'k=3', 'k=4', 'k=5');
ylabel('Acceleration (ms^-2)')

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameter Sweep of d

clear all
clc


m=1;
k=0.2;

for d=0.1:0.1:0.5
    
[t,y]=ode45(@(t,X) secondode(t,X,k,m,d),[0,100],[-0.03,0]); 

figure(1)
plot(t,y(:,1))
hold all
title('Parameter Sweep d [0.1:0.1:0.5]. Plotting y(t) against time',... 
  'FontWeight','bold')
xlabel('Time')
hleg1 = legend('d=0.1', 'd=0.2', 'd=0.3', 'd=0.4', 'd=0.5');
ylabel('y(t)')

figure(2)
plot(t,y(:,2))
hold all
title('Parameter Sweep d [0.1:0.1:0.5]. Plotting dy/dt against time',... 
  'FontWeight','bold')
xlabel('Time')
hleg1 = legend('d=0.1', 'd=0.2', 'd=0.3', 'd=0.4', 'd=0.5');
ylabel('Velocity')

figure(3)
acceleration= (1/m)*(-d*(y(:,2))+k*(y(:,1)));
plot(t, acceleration);
hold all
title('Parameter Sweep d [0.1:0.1:0.5]. Plotting dy2/d2t against time',... 
  'FontWeight','bold')
xlabel('Time')
hleg1 = legend('d=0.1', 'd=0.2', 'd=0.3', 'd=0.4', 'd=0.5');
ylabel('Acceleration')

end