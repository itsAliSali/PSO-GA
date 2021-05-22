# PSO-GA (A hybrid PSO-GA algorithm for constrained optimization problems)
Here is an implementation of a hybrid PSO-GA algorithm[[1]](#1) to solve constrained problems. In this paper, Harish Garg proposed a new algorithm by combining two well-known optimization algorithms, i.e., PSO and GA. Garg uses a penalty method approach[[2]](#2) to solve some constrained problems to evaluate his proposed algorithm.
<br><br>
This project attempts to reproduce the paper's results and opens the way for further scientific research.

# How to use this repo
The optimizer function is named PSO_GA(). Its input arguments are: an objective function, a function to handle constraints, a list of lower and upper bounds of the function domain, and a flag to determine whether the function domain is discrete or not.<br>
See the “Main.m” to understand how PSO_GA() could be used to find the optimum of different constrained problems. 


## References
<a id="1">[1]</a> 
Harish Garg,
A hybrid PSO-GA algorithm for constrained optimization problems,
Applied Mathematics and Computation,
Volume 274,
2016,
Pages 292-305,
ISSN 0096-3003,
https://doi.org/10.1016/j.amc.2015.11.001.
(https://www.sciencedirect.com/science/article/pii/S0096300315014630)<br>
Abstract: The main objective of this paper is to present a hybrid technique named as a PSO-GA for solving the constrained optimization problems. In this algorithm, particle swarm optimization (PSO) operates in the direction of improving the vector while the genetic algorithm (GA) has been used for modifying the decision vectors using genetic operators. The balance between the exploration and exploitation abilities have been further improved by incorporating the genetic operators, namely, crossover and mutation in PSO algorithm. The constraints defined in the problem are handled with the help of the parameter-free penalty function. The experimental results of constrained optimization problems are reported and compared with the typical approaches exist in the literature. As shown, the solutions obtained by the proposed approach are superior to those of existing best solutions reported in the literature. Furthermore, experimental results indicate that the proposed approach may yield better solutions to engineering problems than those obtained by using current algorithms.<br>
Keywords: Particle swarm optimization; Genetic algorithm; Constraint optimization; PSO-GA
<br>
<br>
<a id="2">[2]</a>
Kalyanmoy Deb,
An efficient constraint handling method for genetic algorithms,
Computer Methods in Applied Mechanics and Engineering,
Volume 186, Issues 2–4,
2000,
Pages 311-338,
ISSN 0045-7825,
https://doi.org/10.1016/S0045-7825(99)00389-8.
(https://www.sciencedirect.com/science/article/pii/S0045782599003898)<br>
Abstract: Many real-world search and optimization problems involve inequality and/or equality constraints and are thus posed as constrained optimization problems. In trying to solve constrained optimization problems using genetic algorithms (GAs) or classical optimization methods, penalty function methods have been the most popular approach, because of their simplicity and ease of implementation. However, since the penalty function approach is generic and applicable to any type of constraint (linear or nonlinear), their performance is not always satisfactory. Thus, researchers have developed sophisticated penalty functions specific to the problem at hand and the search algorithm used for optimization. However, the most difficult aspect of the penalty function approach is to find appropriate penalty parameters needed to guide the search towards the constrained optimum. In this paper, GA's population-based approach and ability to make pair-wise comparison in tournament selection operator are exploited to devise a penalty function approach that does not require any penalty parameter. Careful comparisons among feasible and infeasible solutions are made so as to provide a search direction towards the feasible region. Once sufficient feasible solutions are found, a niching method (along with a controlled mutation operator) is used to maintain diversity among feasible solutions. This allows a real-parameter GA's crossover operator to continuously find better feasible solutions, gradually leading the search near the true optimum solution. GAs with this constraint handling approach have been tested on nine problems commonly used in the literature, including an engineering design problem. In all cases, the proposed approach has been able to repeatedly find solutions closer to the true optimum solution than that reported earlier.<br>
Keywords: Constrained optimization; Penalty approach; Niching; Inequality constraints; Equality constraints; Real-parameter GAs; Evolution strategy; Simulated binary crossover; Engineering design