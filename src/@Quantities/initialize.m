% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Quantities: initialize
function initialize(Q,problem)

% Set current iterate
Q.current_iterate_ = Point(problem);

% Set best iterate
Q.best_iterate_ = Q.current_iterate_;

% Start clock
tic;

end % initialize
