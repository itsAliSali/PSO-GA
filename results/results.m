% thie script will load and show results for ...
% ... 30 independant runs.

clear, clc;

%%
disp('# # #  Himmelblau v1: ')

load('Himmelblau-20D.mat')
F_best = vpa(min(f_val), 11)
F_worst = vpa(max(f_val), 11)
F_mean = vpa(mean(f_val), 11)
F_STD = vpa(std(f_val), 5)
F_median = vpa(median(f_val),11)


%%
disp('# # #  Himmelblau v2: ')

load('Himmelblau-v2-20D.mat')
F_best = vpa(min(f_val), 11)
F_worst = vpa(max(f_val), 11)
F_mean = vpa(mean(f_val), 11)
F_STD = vpa(std(f_val), 5)
F_median = vpa(median(f_val),11)


%%
disp('# # # Pressure Vessel: ')

load('population40D.mat')
F_best = vpa(min(f_val), 10)
F_worst = vpa(max(f_val), 10)
F_mean = vpa(mean(f_val), 10)
F_STD = vpa(std(f_val), 5)
F_median = vpa(median(f_val),10)


%%
disp('# # # Welded Beam: ')

load('WeldedBeam-20D.mat')
F_best = vpa(min(f_val), 8)
F_worst = vpa(max(f_val), 8)
F_mean = vpa(mean(f_val), 8)
F_STD = vpa(std(f_val), 3)
F_median = vpa(median(f_val), 8)


%%
disp('# # # Gear Train: ')

load('GearTrain-20D')
F_best = vpa(min(f_val), 6)
F_worst = vpa(max(f_val), 6)
F_mean = vpa(mean(f_val), 6)
F_STD = vpa(std(f_val), 5)
F_median = vpa(median(f_val), 6)


