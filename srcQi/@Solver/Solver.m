classdef (Abstract) Solver

    properties (Abstract)

        direction_computation_
        stepsize_computation_
        stepsize_acceptance_

        iteration_limit
        tol

        problem

        n

    end


    methods (Abstract)

        % Name
        n = name(self)

        % Optimize
        optimize(self)

        % Solution
        sol = solution(self)


    end % methods (abstract)

end
~
