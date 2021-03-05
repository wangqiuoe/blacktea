classdef (Abstract) DirectionComputation

    properties (Abstract)
        n
        problem   % need contain func, grad, hess methods
    end


    methods (Abstract)

        % Name
        n = name(self)

        % Compute direction
        p = computeDirection(self, iterate)
    end % methods (abstract)

end % DirectionComputation
