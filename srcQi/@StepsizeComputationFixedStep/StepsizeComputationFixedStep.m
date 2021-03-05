classdef StepsizeComputationFixedStep < StepsizeComputation

  properties

    n = 'Fixed'
    problem
    alpha = 1

  end 


  methods 
    % Constructor
    function self = StepsizeComputationFixedStep(Problem, params)
        self.alpha = params.stepsize;
        self.problem = Problem;
    end % Constructor

    % Compute stepsize
    function stepsize = computeStepsize(self, ~)
        stepsize = self.alpha;
    end

    % Name
    function n = name(self)
        n = self.n;
    end

  end % methods (public access)

end
