classdef SolverSteepestDescentAdaQi < handle

    properties (SetAccess = public, GetAccess = public)

        direction_computation_
        stepsize_computation_
        stepsize_acceptance_
        status_

        iteration_limit = 100
        tol = 1e-4
        stepsize = 1
        gamma = 0.8
        x0
        
        problem
        n = 'SolverSteepestDescent'
        bestIterate

    end


    methods

        % Constructor
        function self = SolverSteepestDescentAdaQi(varargin)

            % Set problem
            self.problem = varargin{1};

            if nargin > 1
                params = varargin{2};
                if isfield(params, 'iteration_limit')
                    self.iteration_limit = params.iteration_limit;
                end
                if isfield(params, 'tol')
                    self.tol = params.tol;
                end
                if isfield(params, 'stepsize')
                    self.stepsize = params.stepsize;
                end
                if isfield(params, 'gamma')
                    self.gamma = params.gamma;
                end
                if isfield(params, 'x0')
                    self.x0 = params.x0;
                else
                    self.x0 = randn(self.problem.n);
                end
            end

            % Set DirectionComputation strategy
            self.direction_computation_ = DirectionComputationSteepestDescent(self.problem);

            % Set StepsizeComputation strategy
            stepparams.stepsize = self.stepsize;
            stepparams.gamma = self.gamma;
            self.stepsize_computation_ = StepsizeComputationAdaQi(self.problem, stepparams);

            % Set StepsizeAcceptance strategy
            self.stepsize_acceptance_ = [];

        end


        % Name
        function n = name(self)
            n = self.n;
        end

        % Optimize
        optimize(self)

        % Solution
        [x, f, stationarity] = solution(self)

    end % methods

end
