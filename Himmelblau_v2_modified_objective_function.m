function value = Himmelblau_modified_objective_function(x, fw)

[are_satisfied, sum_gi] =  Himmelblau_v2_handle_constraints(x);

if are_satisfied == 1
   value =  5.3578547*(x(3)^2) + 0.8356891*x(1)*x(5) + ...
                    37.293239*x(1) - 40792.141;
else
    value = fw + sum_gi;
end

end