classdef DirectionComputationFirstOrderTrustRegion < DirectionComputation

    properties
        n
        problem   % need contain func, grad, hess methods
    end

    methods (Access = public)

        % Constructor
        function self = DirectionComputationFirstOrderTrustRegion(Problem)
            self.problem = Problem ;
            self.n= "FirstOrderTrustRegion";
        end % Constructor

        % Name
        function n = name(self)
          n = self.n;
        end % name

        p = computeDirection(self, iterate)

    end
end

