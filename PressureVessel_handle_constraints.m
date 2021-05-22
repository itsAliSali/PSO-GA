function [are_satisfied, sum] =  PressureVessel_handle_constraints(x)
are_satisfied = 1;
sum = 0;

g1 = -x(1) + 0.0193*x(3);
    
g2 = -x(2) + 0.0095*x(3);

g3 = -pi*(x(3)^2)*x(4) - 4/3*pi*(x(3)^3)+ 1296000;

g4 = x(4) - 240;
    
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

end
