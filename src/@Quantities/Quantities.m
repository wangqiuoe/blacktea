% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Quantities class
classdef Quantities < handle
  
  % Properties (private access)
  properties (SetAccess = private, GetAccess = private)
    
    %%%%%%%%%%%%%%%%%%%%%%%%
    % ALGORITHM QUANTITIES %
    %%%%%%%%%%%%%%%%%%%%%%%%
    best_iterate_
    current_iterate_
    direction_primal_
    model_reduction_
    ratio_parameter_
    stepsize_
    trial_iterate_
    
    %%%%%%%%%%%%
    % COUNTERS %
    %%%%%%%%%%%%
    iteration_counter_ = 0
    objective_function_evaluation_counter_ = 0
    objective_gradient_evaluation_counter_ = 0
    objective_hessian_evaluation_counter_ = 0
    
    %%%%%%%%%%%%%%
    % INDICATORS %
    %%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%
    % TOLERANCES %
    %%%%%%%%%%%%%%
    cpu_time_limit_
    iteration_limit_
    objective_function_evaluation_limit_
    objective_gradient_evaluation_limit_
    size_limit_;
    stationarity_tolerance_
    
  end
  
  % Methods (static)
  methods (Static)
    
    %%%%%%%%%%%%%%%%%%%
    % OPTIONS METHODS %
    %%%%%%%%%%%%%%%%%%%
    
    % Add options
    addOptions(options,reporter)
    
    %%%%%%%%%%%%%%%
    % GET METHODS %
    %%%%%%%%%%%%%%%
    
    % CPU time
    function s = CPUTime
      
      % Set return value
      s = toc;
      
    end % CPUTime
    
  end
  
  % Methods (public access)
  methods (Access = public)
    
    %%%%%%%%%%%%%%%
    % CONSTRUCTOR %
    %%%%%%%%%%%%%%%
    
    % Constructor
    function Q = Quantities(varargin)
      
      % DO NOTHING
      
    end % Constructor
    
    %%%%%%%%%%%%%%%%%
    % PRINT METHODS %
    %%%%%%%%%%%%%%%%%
    
    % Print iteration header
    printIterationHeader(Q,reporter)
    
    % Print iteration values
    printIterationValues(Q,reporter)
    
    %%%%%%%%%%%%%%%%%%%
    % OPTIONS METHODS %
    %%%%%%%%%%%%%%%%%%%
    
    % Get options
    getOptions(Q,options,reporter)
    
    %%%%%%%%%%%%%%%%%%%%%%
    % INITIALIZE METHODS %
    %%%%%%%%%%%%%%%%%%%%%%
    
    % Initialize
    initialize(Q,problem)
    
    %%%%%%%%%%%%%%%
    % GET METHODS %
    %%%%%%%%%%%%%%%
    
    % Best iterate
    function iterate = bestIterate(Q)
      
      % Set return value
      iterate = Q.best_iterate_;
      
    end % bestIterate
    
    
    % CPU time limit
    function s = CPUTimeLimit(Q)
      
      % Set return value
      s = Q.cpu_time_limit_;
      
    end % CPUTimeLimit
    
    % Current iterate
    function iterate = currentIterate(Q)
      
      % Set return value
      iterate = Q.current_iterate_;
      
    end % currentIterate
    
    % Direction, primal
    function d = directionPrimal(Q)
      
      % Set return value
      d = Q.direction_primal_;
      
    end % directionPrimal
    
    
    % Iteration counter
    function k = iterationCounter(Q)
      
      % Set return value
      k = Q.iteration_counter_;
      
    end % iterationCounter
    
    % Iteration limit
    function k_max = iterationLimit(Q)
      
      % Set return value
      k_max = Q.iteration_limit_;
      
    end % iterationLimit
    
    % Model reduction
    function q = modelReduction(Q)
      
      % Set return value
      q = Q.model_reduction_;
      
    end % modelReduction
    
    % Objective function evaluation counter
    function f = objectiveFunctionEvaluationCounter(Q)
      
      % Set return value
      f = Q.objective_function_evaluation_counter_;
      
    end % objectiveFunctionEvaluationCounter
    
    % Objective function evaluation limit
    function f_max = objectiveFunctionEvaluationLimit(Q)
      
      % Set return value
      f_max = Q.objective_function_evaluation_limit_;
      
    end % objectiveFunctionEvaluationLimit
    
    % Objective gradient evaluation counter
    function g = objectiveGradientEvaluationCounter(Q)
      
      % Set return value
      g = Q.objective_gradient_evaluation_counter_;
      
    end % objectiveGradientEvaluationCounter
    
    % Objective gradient evaluation limit
    function g_max = objectiveGradientEvaluationLimit(Q)
      
      % Set return value
      g_max = Q.objective_gradient_evaluation_limit_;
      
    end % objectiveGradientEvaluationLimit
    
    % Ratio parameter
    function t = ratioParameter(Q)
      
      % Set return value
      t = Q.ratio_parameter_;
      
    end % ratioParameter
    
    % Size limit
    function s_max = sizeLimit(Q)
      
      % Set return value
      s_max = Q.size_limit_;
      
    end % sizeLimit

    % Stationarity tolerance
    function t = stationarityTolerance(Q)
      
      % Set return value
      t = Q.stationarity_tolerance_;
      
    end % stationarityTolerance
    
    % Stepsize
    function a = stepsize(Q)
      
      % Set return value
      a = Q.stepsize_;
      
    end % stepsize
    
    % Trial iterate
    function iterate = trialIterate(Q)
      
      % Set return value
      iterate = Q.trial_iterate_;
      
    end % trialIterate
    
    %%%%%%%%%%%%%%%
    % SET METHODS %
    %%%%%%%%%%%%%%%
    
    % Set direction, primal
    function setDirectionPrimal(Q,direction)
      
      % Set direction
      Q.direction_primal_ = direction;
      
    end % setDirectionPrimal
    
    % Set model reduction
    function setModelReduction(Q,model_reduction)
      
      % Set model reduction
      Q.model_reduction_ = model_reduction;
      
    end % setModelReduction
    
    % Set ratio parameter
    function setRatioParameter(Q,ratio_parameter)
      
      % Set ratio parameter
      Q.ratio_parameter_ = ratio_parameter;
      
    end % setRatioParameter
    
    % Set stepsize
    function setStepsize(Q,stepsize)
      
      % Set stepsize
      Q.stepsize_ = stepsize;
      
    end % setStepsize
    
    % Set trial iterate
    function setTrialIterate(Q,iterate)
      
      % Set trial iterate
      Q.trial_iterate_ = iterate;
      
    end % setTrialIterate
    
    % Update iterate
    function updateIterate(Q)
      
      % Update best iterate
      if (Q.current_iterate_.stationarityMeasure(Q) <= Q.best_iterate_.stationarityMeasure(Q))
        Q.best_iterate_ = Q.current_iterate_;
      end
      
      % Set current iterate to trial iterate
      Q.current_iterate_ = Q.trial_iterate_;
      
    end % updateIterate
    
    %%%%%%%%%%%%%%%%%%%%%
    % INCREMENT METHODS %
    %%%%%%%%%%%%%%%%%%%%%
    
    % Increment iteration counter
    function incrementIterationCounter(Q)
      
      % Increment iteration counter
      Q.iteration_counter_ = Q.iteration_counter_ + 1;
      
    end % incrementIterationCounter
    
    % Increment objective function evaluation counter
    function incrementObjectiveFunctionEvaluationCounter(Q)
      
      % Increment objective function evaluation counter
      Q.objective_function_evaluation_counter_ = Q.objective_function_evaluation_counter_ + 1;
      
    end % incrementObjectiveFunctionEvaluationCounter
    
    % Increment objective gradient evaluation counter
    function incrementObjectiveGradientEvaluationCounter(Q)
      
      % Increment objective gradient evaluation counter
      Q.objective_gradient_evaluation_counter_ = Q.objective_gradient_evaluation_counter_ + 1;
      
    end % incrementObjectiveGradientEvaluationCounter

    % Increment objective hessian evaluation counter
    function incrementObjectiveHessianEvaluationCounter(Q)
      
      % Increment objective gradient evaluation counter
      Q.objective_hessian_evaluation_counter_ = Q.objective_hessian_evaluation_counter_ + 1;
      
    end % incrementObjectiveHessianEvaluationCounter
    
    
  end % methods (public access)
  
end % Quantities
