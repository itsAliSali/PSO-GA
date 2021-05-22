function value = PressureVessel_modified_objective_function(x, fw)

[are_satisfied, sum_gi] =  PressureVessel_handle_constraints(x);

if are_satisfied == 1
   value =  0.6224*x(1)*x(3)*x(4) + 1.7781*x(2)*(x(3)^2) + ...
                3.1661*(x(1)^2)*x(4) + 19.84*(x(1)^2)*x(3);
else
    value = fw + sum_gi;
end

end