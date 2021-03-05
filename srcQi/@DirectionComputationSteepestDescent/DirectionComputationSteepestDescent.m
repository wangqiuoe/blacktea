classdef DirectionComputationSteepestDescent < DirectionComputation

    properties
        n
        problem   % need contain func, grad, hess methods
    end

    methods (Access = public)

        % Constructor
        function self = DirectionComputationSteepestDescent(Problem)
            self.problem = Problem ;
            self.n= "SteepestDescent";
        end % Constructor

        % Name
        function n = name(self)
          n = self.n;
        end % name

        p = computeDirection(self, iterate)

    end
end

