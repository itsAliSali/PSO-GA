function [min, x_min] = PSO_GA(bounds, func,...
                            func_coinstraints, integer_enable)
% integer enable: if == 1 then: optimize for integer Xi.
% Definig constants:

% parameters are set as they were in article:

PSO_MaxIter = 500;          % termination criteria
dim = size(bounds, 1);      % dimention of Position
population_size = 20 * dim;
wL = 0.4;               % lower bound for w (used to update V)
wU = 0.9;               % upper bound for w (used to update V)
c1 = 1.5;  % weight for effect of best position of paticle (used to update V)
c2 = 1.5;  % weight for effect of global best position (used to update V)
V_max = bounds(:,2) - bounds(:,1);

fw = inf;             % worst feasible solution.

% setting the dimention of variables:
P = zeros(dim, population_size);        % P(:,i) := position of ith particle
P_best = zeros(dim, population_size);   % P_best(:,i) := best position that ... 
                                        % ... ith particle has ever gone.

F_P_best = zeros(1, population_size);   % func( P_best(:,i) )

V = zeros(dim, population_size);        % V(:,i) := velocity of ith particle

g_best = zeros(dim, 1);         % global best position
F_g_best = inf;                 % func( g_best )  

GA_NumMax = 20; 
GA_NumMin = 1;
GA_Num = GA_NumMax;

GA_MinPS = 10;
GA_MaxPS = 40;      % not stated in article.
GA_PS = GA_MinPS;

GA_MinIter = 10;
GA_MaxIter = 40;    % not stated in article.    
GA_Iter = GA_MinIter;

gama = 10;
beta= 15;

lineLength=7;       % used to log iterations.

%% Initialize:
for i = 1:1:dim
   P(i,:) = rand(1, population_size)*(bounds(i,2)-bounds(i,1)) + bounds(i,1);
   V(i,:) = rand(1, population_size)*(bounds(i,2)-bounds(i,1)) + bounds(i,1); 
end
if integer_enable == 1
    P = round(P);
end
P_best = P;

% calculating best particle function value.
for i = 1:1:population_size
    F_Pi = func(P_best(:,i), fw);
    [are_satisfied, ~] = func_coinstraints(P_best(:,i));
    
    % if fw was not updated and Pi is feasible then update fw.
    if fw == inf && are_satisfied == 1  
      fw = F_Pi;
    end
    
    % updating worst feasible solution:
    if F_Pi > fw && are_satisfied==1
        fw = F_Pi;     
    end
    F_P_best(:,i) = F_Pi;
end


%% PSO cycles:
for PSO_i = 1:1:PSO_MaxIter
      
    w = wU - (wU - wL) * PSO_i/PSO_MaxIter;
    
    % memory update:(minimizing)
    for i = 1:1:population_size
        F_Pi = func(P(:,i), fw);
        if F_Pi < F_P_best(i)
            P_best(:,i) = P(:,i);
            F_P_best(i) = F_Pi;
        end
        if F_Pi < F_g_best
            g_best = P(:,i); 
            F_g_best = F_Pi;
        end
        % updating worst feasible solution:
        [are_satisfied, ~] = func_coinstraints(P(:,i));
        if F_Pi > fw && are_satisfied==1
            fw = F_Pi;
        end
        % if fw was not updated and Pi is feasible then update fw.
        if fw == inf && are_satisfied == 1  
            fw = F_Pi;
        end
     end

        
    for i = 1:1:population_size
        
        % velocity updating:
        V(:,i) = w*V(:,i) + c1*rand()*(P_best(:,i)-P(:,i)) + ...
                                        c2*rand()*(g_best-P(:,i));
        for j = 1:1:dim
            if V(j,i) > V_max(j)
                V(j,i) = V_max(j);
            end
            if V(j,i) < -V_max(j)
                V(j,i) = -V_max(j);
            end 
        end
        
        % position updating:
        P(:,i) = P(:,i) + V(:,i);
        if integer_enable == 1
            P = round(P);
        end
        for j = 1:1:dim
            if P(j,i) > bounds(j,2)
                P(j,i) = bounds(j,2);
            end
            if P(j,i) < bounds(j,1)
                P(j,i) = bounds(j,1);
            end 
        end
    end
    
    % Evolution of each individual:
    % indices of individuals affected by GA:
    indices = randperm(population_size, round(GA_Num));
    
    for i = indices  % length = GA_Num
        X = P(:,i);
        % Apply GA:
        X_evolved = GA(X, GA_PS, GA_Iter,...
                        bounds, func, func_coinstraints,...
                        integer_enable);
        P(:,i) = X_evolved';
    end
    
    % update GA parameters:
    GA_Num = GA_NumMax-(PSO_i/PSO_MaxIter)^gama*(GA_NumMax-GA_NumMin);
    GA_PS = GA_MinPS+(PSO_i/PSO_MaxIter)^gama*(GA_MaxPS - GA_MinPS);
    GA_Iter = GA_MinIter+(PSO_i/PSO_MaxIter)^beta*(GA_MaxIter - GA_MinIter);
    
    % loging iterations:
    fprintf(repmat('\b',1,lineLength))    
    lineLength = fprintf('\niter: %i', PSO_i);


end % end of PSO_MaxIter loop.
min = F_g_best;
x_min = g_best;
end % end of function