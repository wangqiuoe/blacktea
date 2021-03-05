% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Strategies: addOptions
function addOptions(options,reporter)

% Add options
options.addStringOption(reporter,'direction_computation','SteepestDescent');
options.addStringOption(reporter,'stepsize_computation','Fixed');

% Add direction computation options
classes = dir('../src/@DirectionComputation*');
for i=1:length(classes)
    classname = classes(i).name;
    if string(classname) == "@DirectionComputation"
        % pass
    else
        classname = classname(2:length(classname));
        d = eval(classname);
        d.addOptions(options,reporter);
    end
end


% Add stepsize computation options
classes = dir('../src/@StepsizeComputation*');
for i=1:length(classes)
    classname = classes(i).name;
    if string(classname) == "@StepsizeComputation"
        % pass
    else
        classname = classname(2:length(classname));
        d = eval(classname);
        d.addOptions(options,reporter);
    end
end

end % addOptions
