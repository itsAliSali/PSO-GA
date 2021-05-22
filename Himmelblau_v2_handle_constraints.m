function [are_satisfied, sum] =  Himmelblau_v2_handle_constraints(x)
are_satisfied = 1;
sum = 0;

g1 = 85.334407 + 0.0056858*x(2)*x(5) + ...
        0.00026*x(1)*x(4) - 0.0022053*x(3)*x(5);
    
g2 = 80.51249 + 0.0071317*x(2)*x(5) + ...
        0.0029955*x(1)*x(2) - 0.0021813*(x(3)^2);

g3 = 9.300961 + 0.0047026*x(3)*x(5) + ...
        0.0012547*x(1)*x(3) + 0.0019085*x(3)*x(4);
    
% if any of constraints is violated then constraints are not satisfied.    
if -g1 > 0
    are_satisfied = 0;
    sum = sum + (-g1);
end
if g1-92 > 0
    are_satisfied = 0;
    sum = sum + (g1-92);
end
if 90-g2 > 0
    are_satisfied = 0;
    sum = sum + (90-g2);
end
if g2-110 > 0
    are_satisfied = 0;
    sum = sum + (g2-110);
end
if 20-g3 > 0
    are_satisfied = 0; 
    sum = sum + (20-g3);
end
if g3-25 > 0
    are_satisfied = 0;
    sum = sum + (g3-25);
end


end
