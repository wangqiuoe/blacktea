classdef Printer < handle
    methods 
        function printIterationHeader(self, iteration)

            % Print iteration header
            for k=1:numel(fn)
if( size(S.bestIterate.(fn{k}),1) == 1 )
disp(S.bestIterate.(fn{k}))
end

end

        end % printIterationHeader

    end
