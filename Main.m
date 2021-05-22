% Authors: Ali Salimian - 9627773
%          Ali Kahe - 9629513
%
% Numerical Optimization - Spring 2020

% An implementaion of PSO+GA algorithm(H.Garg 2016):

clear; close all; clc

num_rum = 1;       % number of independant run.
                   % we run algorithm 30 times, but ..
                   % ... it will take to much time. 
 

%% Himmelblau v1:
f_val_Himmelblau_v1 = zeros(num_rum,1);   % function value for each run.
run_Himmelblau_v1 = zeros(num_rum, 5);    % X_min for each run.

f = @Himmelblau_modified_objective_function;
f2 = @Himmelblau_handle_constraints;
bounds = [78 102;
          33 45;
          27 45;
          27 45;
          27 45];

for i = 1:num_rum
    disp (['___Himmelblau_v1: ', num2str(i), '         '])
    [F_min, x_min] = PSO_GA(bounds, f, f2, 0)
    f_val_Himmelblau_v1(i)= F_min;
    run_Himmelblau_v1(i,:)= x_min;
end
F_best = vpa(min(f_val_Himmelblau_v1), 11)
F_worst = vpa(max(f_val_Himmelblau_v1), 11)
F_mean = vpa(mean(f_val_Himmelblau_v1), 11)
F_STD = vpa(std(f_val_Himmelblau_v1), 5)
F_median = vpa(median(f_val_Himmelblau_v1),11)


%% Himmelblau v2:
f_val_Himmelblau_v2 = zeros(num_rum, 1);  % function value for each run.
run_Himmelblau_v2 = zeros(num_rum, 5);    % X_min for each run.

f = @Himmelblau_v2_modified_objective_function;
f2 = @Himmelblau_v2_handle_constraints;
bounds = [78 102;
          33 45;
          27 45;
          27 45;
          27 45];

for i = 1:num_rum
disp (['___Himmelblau_v2: ', num2str(i), '         '])
    [F_min, x_min] = PSO_GA(bounds, f, f2, 0)
    f_val_Himmelblau_v2(i)= F_min;
    run_Himmelblau_v2(i,:)= x_min;
end
F_best = vpa(min(f_val_Himmelblau_v2), 11)
F_worst = vpa(max(f_val_Himmelblau_v2), 11)
F_mean = vpa(mean(f_val_Himmelblau_v2), 11)
F_STD = vpa(std(f_val_Himmelblau_v2), 5)
F_median = vpa(median(f_val_Himmelblau_v2),11)


%% Pressure Vessel:    
f_val_PV = zeros(num_rum, 1);  % function value for each run.
run_PV = zeros(num_rum, 4);    % X_min for each run.

f = @PressureVessel_modified_objective_function;
f2 = @PressureVessel_handle_constraints;
bounds = [1*0.0625 99*0.0625;
          1*0.0625 99*0.0625;
          10 200;
          10 200 ];       

for i = 1:num_rum
    disp(['___Pressure Vessel: ', num2str(i), '        '])
    [F_min, x_min] = PSO_GA(bounds, f, f2, 0)
    f_val_PV(i)= F_min;
    run_PV(i,:)= x_min;
end
F_best = vpa(min(f_val_PV), 10)
F_worst = vpa(max(f_val_PV), 10)
F_mean = vpa(mean(f_val_PV), 10)
F_STD = vpa(std(f_val_PV), 5)
F_median = vpa(median(f_val_PV),10)


%% Welded Beam:
f_val_WB = zeros(num_rum, 1);  % function value for each run.
run_WB = zeros(num_rum, 4);    % X_min for each run.

f = @WeldedBeam_modified_objective_function;
f2 = @WeldedBeam_handle_constraints;
bounds = [0.1 2;
          0.1 10;
          0.1 10;
          0.1 2];

for i = 1:num_rum
    disp (['___Welded beam: ', num2str(i), '         '])
    [F_min, x_min] = PSO_GA(bounds, f, f2, 0)
    f_val_WB(i)= F_min;
    run_WB(i,:)= x_min;
end
F_best = vpa(min(f_val_WB), 8)
F_worst = vpa(max(f_val_WB), 8)
F_mean = vpa(mean(f_val_WB), 8)
F_STD = vpa(std(f_val_WB), 3)
F_median = vpa(median(f_val_WB), 8)


%% Gear Train:
f_val_GT = zeros(num_rum, 1);  % function value for each run.
run_GT = zeros(num_rum, 4);    % X_min for each run.

f = @GearTrain_objective_function;
f2 = @GearTrain_handle_constraints;
bounds = [12 60;
          12 60;
          12 60;
          12 60];

for i = 1:num_rum
    disp (['___GaerTrain: ', num2str(i), '         '])
    [F_min, x_min] = PSO_GA(bounds, f, f2, 1)
    f_val_GT(i)= F_min;
    run_GT(i,:)= x_min;
end    
F_best = vpa(min(f_val_GT), 6)
F_worst = vpa(max(f_val_GT), 6)
F_mean = vpa(mean(f_val_GT), 6)
F_STD = vpa(std(f_val_GT), 5)
F_median = vpa(median(f_val_GT), 6)
