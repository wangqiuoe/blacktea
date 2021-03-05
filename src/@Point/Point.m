% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Point class
classdef Point < handle
  
  % Properties (private access)
  properties (SetAccess = private, GetAccess = private)
    
    %%%%%%%%%%%
    % Problem %
    %%%%%%%%%%%
    p
    
    %%%%%%%%%%%%%%
    % QUANTITIES %
    %%%%%%%%%%%%%%
    n % number of variables
    x % primal point
    f % objective function
    g % objective gradient
    h % objective Hessian
    
    %%%%%%%%%
    % NORMS %
    %%%%%%%%%
    g_norm1
    g_norm2
    g_normInf
    
    %%%%%%%%%%%%%%%%%
    % SCALE FACTORS %
    %%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%
    % INDICATORS %
    %%%%%%%%%%%%%%
    f_evaluated = false
    g_evaluated = false
    h_evaluated = false
    g_norm1_evaluated = false
    g_norm2_evaluated = false
    g_normInf_evaluated = false
        
  end % properties (private access)
  
  % Methods (public access)
  methods (Access = public)
    
    %%%%%%%%%%%%%%%
    % CONSTRUCTOR %
    %%%%%%%%%%%%%%%
    
    % Constructor
    function P = Point(varargin)
      
      % Check for correct number of input arguments
      if nargin < 1 || nargin > 2
        error('Point: Incorrect number of inputs to constructor.');
      end
      
      % Check for problem input (1 argument)
      if nargin == 1
        
        % Set problem
        P.p = varargin{1};
      
        % Set initial primal point
        P.x = P.p.initialPoint;
      
        % Set number of variables
        P.n = P.p.numberOfVariables;
        
      else % point + vector input (2 arguments)
        
        % Copy members from input point
        P.p = varargin{1}.problem;
        P.n = varargin{1}.numberOfVariables;
        
        % Set point
        P.x = varargin{2};
      
      end
      
    end % Constructor

    %%%%%%%%%%%%%%%%%%%%
    % MAKE NEW METHODS %
    %%%%%%%%%%%%%%%%%%%%
    
    % Make linear combination
    function P = makeLinearCombination(P_curr,alpha,d)
      
      % Create new point
      P = Point(P_curr,P_curr.primalPoint + alpha*d);
      
    end % makeLinearCombination
    
    %%%%%%%%%%%%%%%
    % SET METHODS %
    %%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%
    % GET METHODS %
    %%%%%%%%%%%%%%%
    
    % Number of variables
    function n = numberOfVariables(P)
      
      % Set number of variables
      n = P.n;
      
    end % numberOfVariables
    
    % Primal point
    function x = primalPoint(P)
      
      % Set point
      x = P.x;
      
    end % primalPoint
    
    % Problem
    function p = problem(P)
      
      % Set problem
      p = P.p;
      
    end % problem
    
    %%%%%%%%%%%%%%%%%%%%%%
    % EVALUATION METHODS %
    %%%%%%%%%%%%%%%%%%%%%%
   
    % Objective hessian
    function H = objectiveHessian(P,quantities)

      % Check if already evaluated
      if ~P.h_evaluated

        % Evaluate
        [P.h,err] = P.p.evaluateObjectiveHessian(P.x);

        % Check for error
        if err == true
          error('Point: Error evaluating objective hessian!');
        end

        % Set indicator
        P.h_evaluated = true;

        % Increment counter
        quantities.incrementObjectiveHessianEvaluationCounter;

      end

      % Set objective gradient value
      H = P.h;

    end % end objectiveGradient

    % Stationarity measure
    function v = stationarityMeasure(P,quantities)
      
      % Evaluate measure
      v = P.objectiveGradientNorm2(quantities);
      
    end % stationarityMeasure
    
    % Objective function
    function f = objectiveFunction(P,quantities)
      
      % Check if already evaluated
      if ~P.f_evaluated
        
        % Evaluate
        [P.f,err] = P.p.evaluateObjectiveFunction(P.x);
        
        % Check for error
        if err == true
          error('Point: Error evaluating objective function!');
        end
        
        
        % Set indicator
        P.f_evaluated = true;
        
        % Increment counter
        quantities.incrementObjectiveFunctionEvaluationCounter;
        
      end
      
      % Set objective function value
      f = P.f;
      
    end % objectiveFunction
    
    % Objective gradient
    function g = objectiveGradient(P,quantities)

      % Check if already evaluated
      if ~P.g_evaluated
        
        % Evaluate
        [P.g,err] = P.p.evaluateObjectiveGradient(P.x);

        % Check for error
        if err == true
          error('Point: Error evaluating objective gradient!');
        end

        % Set indicator
        P.g_evaluated = true;
        
        % Increment counter
        quantities.incrementObjectiveGradientEvaluationCounter;
        
      end
      
      % Set objective gradient value
      g = P.g;
      
    end % end objectiveGradient
    
    % Objective gradient 1-norm
    function v = objectiveGradientNorm1(P,quantities)
      
      % Check if norm evaluated
      if ~P.g_norm1_evaluated
        
        % Check if objective function evaluated
        if ~P.g_evaluated
          
          % Evaluate objective gradient function
          P.objectiveGradient(quantities);
          
        end
        
        % Evaluate norm
        P.g_norm1 = norm(P.g,1);
        
      end
      
      % Set return value
      v = P.g_norm1;
      
    end % end objectiveGradientNorm1

    % Objective gradient 2-norm
    function v = objectiveGradientNorm2(P,quantities)

      % Check if norm evaluated
      if ~P.g_norm2_evaluated

        % Check if objective function evaluated
        if ~P.g_evaluated

          % Evaluate objective gradient function
          P.objectiveGradient(quantities);

        end

        % Evaluate norm
        P.g_norm2 = norm(P.g,2);

      end

      % Set return value
      v = P.g_norm2;

    end % end objectiveGradientNorm2

    % Gradient inf-norm
    function v = objectiveGradientNormInf(P,quantities)
      
      % Check if norm evaluated
      if ~P.g_normInf_evaluated
        
        % Check if objective function evaluated
        if ~P.g_evaluated
          
          % Evaluate objective gradient function
          P.objectiveGradient(quantities);
          
        end
        
        % Evaluate norm
        P.g_normInf = norm(P.g,'inf');
        
      end
      
      % Set return value
      v = P.g_normInf;
      
    end % end constraintNormInf
    
  end % methods (public access)
  
end % Point
