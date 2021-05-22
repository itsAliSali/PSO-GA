function output = GA(X, GA_PS, GA_MaxIter, bounds, ...  
                        func, func_constrains, integer_enable)
% parameters are set as they were in article:   
N = 2*ceil(GA_PS/2);        % population size (size must be even for crossover)
dim = length(bounds(:,1));  
CL = 16 * dim;              % Number of bits in each chromosome

CR = 0.85;      % Crossover Rate 
MR = 0.02 ;     % Mutation Rate
ER = 0.05;      % Elitism Rate (not stated in article)

c = zeros(N, CL);
new_c = zeros(N, CL) ;
f = zeros(N, 1);


%% main 

c(1, :) = code(X, bounds);
    
are_satisfied = 0; 
while(are_satisfied==0)
    for i=2: N 
        for j = 1:1:CL 
            if rand < 0.5
                c(i,j) = 0 ;
            else
                c(i,j) = 1 ;
            end
        end
        x = decode( c(i,:) , bounds, integer_enable);
        [are_satisfied , ~] = func_constrains(x);
        if are_satisfied == 1 
            fw = func(x,0);
        end
    end
end               

% finding fw:
for i = i:N
   x = decode(c(i,:), bounds, integer_enable);
   [are_satisfied , ~] = func_constrains(x);
   f_x = func(x, fw);
   if are_satisfied==1 && f_x > fw
       fw = f_x;
   end
end
       
%start GA cycle
for generation = 1:1:GA_MaxIter 
    %new_c = c;
    k=1;
    for i = randperm(N)
        new_c(k,:) = c(i,:);
        k = k +1;
    end
    
    %-----1-site crossover------
    for i=1:2:N
        if(rand<CR)
            site = ceil(rand*CL);
            temp = new_c(i,site:end);
            new_c(i,site:end) = new_c(i+1,site:end);
            new_c(i+1,site:end) = temp;
        end
    end

    %-----mutation---------
    for i=1:N
        for j =1:CL
            if rand<MR
            new_c(i,j) = 1 - new_c(i,j);
            end
        end
    end
    
    % func value for old generaions:
    for i=1:N 
        x = decode(c(i,:), bounds, integer_enable);
        f(i) = func(x, fw);
   end
    
    % elitism:
    Elite_no = 1 + ceil(N * ER);
    [~, index] = sort(f);
    for k = 1:Elite_no
        new_c(k,:) = c(index(k),:);
    end

    c = new_c;
    
    % updating fw:
    for i=1:N 
        x = decode( c(i,:) , bounds, integer_enable);
        f(i) = func(x, fw);
        [are_satisfied , ~] = func_constrains(x);
        if f(i) > fw  &&  are_satisfied == 1 
            fw = f(i);
        end
    end 
    
    % output is best, feasible chromosome.
    for i = 1:N
        x = decode(c(i,:) , bounds, integer_enable); 
        [are_satisfied , ~] = func_constrains(x);
        if are_satisfied==1
            output = x;
            break;
        end
    end

end % end of loop
               
               
end