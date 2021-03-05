classdef DirectionComputationNewton < DirectionComputation

    properties
        n
        problem   % need contain func, grad, hess methods
    end

    methods (Access = public)

        % Constructor
        function self = DirectionComputationNewton(Problem)
            self.problem = Problem ;
            self.n= "Newton";
        end % Constructor

        % Name
        function n = name(self)
          n = self.n;
        end % name

        p = computeDirection(self, iterate)

    end
end

