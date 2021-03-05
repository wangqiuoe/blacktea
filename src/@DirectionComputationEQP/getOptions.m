% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% DirectionComputationEQP: getOptions
function getOptions(D,options,reporter)

% Get options
D.use_hessian_of_lagrangian_ = options.getOption(reporter,'DCEQP_use_hessian_of_lagrangian');

end % getOptions