function [are_satisfied, sum] =  WeldedBeam_handle_constraints(x)
are_satisfied = 1;
sum = 0;

t_max = 13600;
sigma_max = 30000;
P = 6000;
L = 14;
E = 30e6;
G = 12e6;

t1 = P / (sqrt(2) * x(1) * x(2));
M = P * (L + x(2)/2);
J = 2* (sqrt(2)*x(1)*x(2) * (x(2)^2/4 + (x(1)/2+x(3)/2)^2 ));
R = sqrt(x(2)^2/4 + (x(1)/2+x(3)/2)^2 );
t2 = M*R/J;
t = sqrt(t1^2 + 2*t1*t2*x(2)/2/R + t2^2); 

sigma = 6*P*L/x(4)/(x(3)^2);

delta = 6*P*L^3/E/x(4)/(x(3)^3);

P_c = 4.013*E*sqrt(x(3)^2*x(4)^6/36 ) / L^2 * (1-x(3)/2/L*sqrt(E/4/G));

g1 = t - t_max;
    
g2 = sigma - sigma_max;

g3 = x(1) - x(4);

g4 = 0.125 - x(1);
  
g5 = delta - 0.25;
   
g6 = P - P_c;

g7 = 0.10471*x(1)^2 + 0.04811*x(3)*x(4)*(14 + x(2)) - 5;


% if any of constraints is violated then constraints are not satisfied.    
if g1 > 0
    are_satisfied = 0;
    sum = sum + (g1);
end
if g2 > 0
    are_satisfied = 0;
    sum = sum + (g2);
end
if g3 > 0
    are_satisfied = 0;
    sum = sum + (g3);
end
if g4 > 0
    are_satisfied = 0;
    sum = sum + (g4);
end
if g5 > 0
    are_satisfied = 0;
    sum = sum + (g5);
end
if g6 > 0
    are_satisfied = 0;
    sum = sum + (g6);
end
if g7 > 0
    are_satisfied = 0;
    sum = sum + (g7);
end


end
