classdef StepsizeComputationAdaQi < StepsizeComputation

  properties

    n = 'AdaQi'
    problem
    alpha = 10
    gamma = 0.8

  end 


  methods 
    % Constructor
    function self = StepsizeComputationAdaQi(varargin)
        self.problem = varargin{1};
        if nargin == 2
            params = varargin{2};
            self.gamma = params.gamma;
            self.alpha = params.stepsize;
        end
    end % Constructor

    % Compute stepsize
    stepsize = computeStepsize(self, iterate)

    % Name
    function n = name(self)
        n = self.n;
    end

  end % methods (public access)

end
