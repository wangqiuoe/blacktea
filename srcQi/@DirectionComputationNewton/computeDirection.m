% Newton Direction

function p = computeDirection(self, iterate)

    H = self.problem.hess(iterate.x);
    g = self.problem.grad(iterate.x);
    p = - H\g;                 % Solve the Newton linear system.

end
