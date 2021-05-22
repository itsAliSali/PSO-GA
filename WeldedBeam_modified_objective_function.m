function value = WeldedBeam_modified_objective_function(x, fw)

[are_satisfied, sum_gi] =  WeldedBeam_handle_constraints(x);

if are_satisfied == 1
   value =  1.10471 * (x(1)^2) * x(2) + 0.04811* x(3)* x(4)* (14 + x(2));
else
    value = fw + sum_gi;
end

end