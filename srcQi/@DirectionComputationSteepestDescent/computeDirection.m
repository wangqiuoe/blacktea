% Steepest Descent Direction: negatve gradient

function p = computeDirection(self, iterate)

    p = - self.problem.grad(iterate.x);

end
