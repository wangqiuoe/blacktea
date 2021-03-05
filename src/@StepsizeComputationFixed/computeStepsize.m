function computeStepsize(S,options,quantities,reporter,strategies)


% Compute stepsize
alpha = S.stepsizeinit_;

% Set stepsize
quantities.setStepsize(alpha);

end % computeStepsize
