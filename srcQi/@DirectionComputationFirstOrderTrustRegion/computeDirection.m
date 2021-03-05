function p = computeDirection(self, iterate)

    radius = iterate.radius;
    g = self.problem.grad(iterate.x);
    p = -radius* g/norm(g);              

end
