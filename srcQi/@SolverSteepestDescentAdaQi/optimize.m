function optimize(self)

% Initialization.
iterate.x = self.x0;
iterate.g = self.problem.grad(iterate.x);
iterate.f = self.problem.func(iterate.x);
iterate.norm_g = norm(iterate.g);
iterate.p = 0;
iterate.stepsize = 0;
iterate.i = 0;

iterate.norm_g0 = iterate.norm_g;
iterate.stationarityMeasure = Enumerations.T_FIRST_ORDER_STATIONARY;

header     = '  Iter         f          norm_g          stepsize';
fprintf('%s\n',header);
% Main loop
while true
    fprintf(' %5g %14.7e %14.7e %14.7e\n', iterate.i, iterate.f, ... 
    iterate.norm_g, iterate.stepsize);

    % Check for termination
    if ( iterate.norm_g <= self.tol*max(1,iterate.norm_g0) )
        self.status_ = Enumerations.S_SUCCESS;
        break
    elseif ( iterate.i >= self.iteration_limit )
        self.status_ = Enumerations.S_ITERATION_LIMIT;
        break
    elseif isnan(iterate.f) || isinf(iterate.f)
        self.status_ = Enumerations.S_FUNCTION_INF_NAN;
        break
    elseif sum(isnan(iterate.g(:))) >= 1 || sum(isinf(iterate.g(:))) >= 1
        self.status_ = Enumerations.S_GRADIENT_INF_NAN;
        break
    end
  
    % Compute direction
    iterate.p = self.direction_computation_.computeDirection(iterate);
  
    % Compute stepsize 
    iterate.stepsize = self.stepsize_computation_. computeStepsize(iterate);
 
    % Update.
    iterate.x = iterate.x + iterate.stepsize * iterate.p;
    iterate.g = self.problem.grad(iterate.x);
    iterate.f = self.problem.func(iterate.x);
    iterate.norm_g = norm(iterate.g);
    iterate.i = iterate.i + 1;

    % Print new line

  
end % main loop

% Print new line
%TODO

self.bestIterate = iterate;
fprintf('debug');

% Print footer
%TODO

end % optimize
