% Authors: Frank E. Curtis

% Enumerations class
classdef Enumerations < uint8

  enumeration

    %%%%%%%%%%%%%%%%%%%
    % SOLVER STATUSES %
    %%%%%%%%%%%%%%%%%%%
    S_UNSET (0)
    S_SUCCESS (1)
    S_SIZE_LIMIT (2)
    S_ITERATION_LIMIT (3)
    S_FUNCTION_INF_NAN (4)
    S_GRADIENT_INF_NAN (5)
    S_DIRECTION_COMPUTATION_FAILURE (6)

    %%%%%%%%%%%%%%%%%%%%%%%
    % TERMINATE CONDITION %
    %%%%%%%%%%%%%%%%%%%%%%%
    T_FIRST_ORDER_STATIONARY (7)

  end % enumeration

end % Enumerations
