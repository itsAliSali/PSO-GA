function value = GearTrain_objective_function(x, fw)
% fw was not needed. inorder to be same as other functions, I just add it.
value =( 1/6.931 - (x(1)*x(2))/(x(3)*x(4)) ) ^ 2; 

end