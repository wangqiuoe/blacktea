% Class417Problems class
classdef Class417Problems
  
  properties
    funobj
  end

  % Methods (public access)
  methods (Access = public)
    
    %%%%%%%%%%%%%%%
    % CONSTRUCTOR %
    %%%%%%%%%%%%%%%
    
    % Constructor
    function P = Class417Problems(funobj)
      P.funobj = funobj;
      
    end % Constructor
    
    
    % Objective function
    function [f,err] = evaluateObjectiveFunction(P,x)
      
      % Evaluate objective function
      f = P.funobj.func(x);
      % No error
      err = false;
      
    end % evaluateObjectiveFunction
    
    % Objective gradient
    function [g,err] = evaluateObjectiveGradient(P,x)
      
      % Evaluate objective gradient
      g = P.funobj.grad(x);
      % No error
      err = false;
      
    end % evaluateObjectiveGradient

    % Objective hessian
    function [g,err] = evaluateObjectiveHessian(P,x)

      g = P.funobj.hess(x);
      err = false;

    end % evaluateObjectiveHessian
    
    % Initial point
    function x = initialPoint(P)
      
      % Set initial point
      x = randn(P.funobj.n, 1);
      
    end % initialPoint
    
    % Name
    function s = name(P)
      
      % Set name
      s = P.funobj.name;
      
    end % name
    
    % Number of variables
    function n = numberOfVariables(P)
      
      % Set number of variables
      n = P.funobj.n;
      
    end % numberOfVariables
        
  end % methods (public access)
  
end % Class417Problems
