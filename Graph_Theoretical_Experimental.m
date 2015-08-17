% This is a Matlab function which models the simple harmonic motion
% system, it uses the secondode.m file to create the mathematical model. 
% this model is then compared to actual data using only the maximum 
% peaks obtained from boh experiment. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get Simulated Signal

 d = 0.01; 
 k = 3;
 m = 0.386; 

 [t,y]=ode45(@(t,X) secondode(t,X,k,m,d),[0,100],[0.3,0]); 
 acceleration= (1/m)*(-d*(y(:,2))+k*(y(:,1))) + 9.8;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get Data

data = csvread('data.csv');
 x_Gs1 = data(:, 1);
 x_Acc1 = x_Gs1*9.81;
 y_Gs1 = data(:, 2);
 y_Acc1 = y_Gs1*9.81;
 z_Gs1 = data(:, 3);
 z_Acc1 = z_Gs1*9.81; 

 x2_Gs2 = data(:, 4);
 x2_Acc2 = x2_Gs2*9.81;
 y2_Gs2 = data(:, 5);
 y2_Acc2 = y2_Gs2*9.81;
 z2_Gs2 = data(:, 6);
 z2_Acc2 = z2_Gs2*9.81;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get Peaks of Z

[maxVal1, minVal1] = peakdet(z2_Acc2, 0.05);
 figure(3) 
 hold on; 
 title('Plotting Z Acceleration Values for Sensor 2',... 
  'FontWeight','bold')
 plot(z2_Acc2, 'Color', 'b', 'LineStyle', '-')
 plot(minVal1(:,1), minVal1(:,2), 'g*');
 plot(maxVal1(:,1), maxVal1(:,2), 'r*');
 xlabel('Index')
 ylabel('Acceleration ms^-2')
 hold off;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get Peaks of Simulation:

[maxVal2, minVal2] = peakdet(acceleration, 0.01);
 
 figure(4) 
 hold on; 
 title('Plotting Theoretical Acceleration',... 
  'FontWeight','bold')
 plot(acceleration, 'Color', 'b', 'LineStyle', '-')
 plot(minVal2(:,1), minVal2(:,2), 'g*');
 plot(maxVal2(:,1), maxVal2(:,2), 'r*');
 xlabel('Index')
 ylabel('Acceleration ms^-2')
 Hold off
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compare Peaks: 

 figure(5)
 maxValA_Aligned=maxVal1(:,2);
 maxValB_Aligned=maxVal2(:,2);
 maxValA_Aligned = maxValA_Aligned(1:size(maxValB_Aligned));
 plot(maxValA_Aligned,maxValB_Aligned, '.');
 axis([0 14 0 14]);
 lsline
 title('Comparing the Experimental Value of sensor 1 to Theoretical Acceleration',...
     'FontWeight','bold')
 xlabel('Cloth Acceleration (ms^-2)')
 ylabel('Non-Cloth Acceleration(ms^-2)')