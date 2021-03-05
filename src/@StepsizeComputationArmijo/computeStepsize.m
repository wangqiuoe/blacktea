function computeStepsize(S,options,quantities,reporter,strategies)


% Compute stepsize

% trial stepsize
alpha = S.stepsizeinit_;

% Create trial iterate
trial_iterate = Point(quantities.currentIterate,quantities.currentIterate.primalPoint + alpha * quantities.directionPrimal);

f = quantities.currentIterate.objectiveFunction(quantities);
g = quantities.currentIterate.objectiveGradient(quantities);
p = quantities.directionPrimal;
f_trial = trial_iterate.objectiveFunction(quantities);

while f_trial > f + S.c1_*alpha*g'*p
    alpha = S.tao_ * alpha;
    trial_iterate = Point(quantities.currentIterate,quantities.currentIterate.primalPoint + alpha * quantities.directionPrimal);
    f_trial = trial_iterate.objectiveFunction(quantities);
end


% Set stepsize
quantities.setStepsize(alpha);

end % computeStepsize
