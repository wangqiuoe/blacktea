function stepsize = computeStepsize(self, iterate)

  % initial  
  M = -inf;
  alpha0 = self.alpha;
  x = iterate.x;
  g = iterate.g;
  f = iterate.f;
  norm_g = iterate.norm_g;

  while 1
      x_new = x - alpha0*g;
      norm_p = alpha0*norm_g;
      g_new = self.problem.grad(x_new);
      f_new = self.problem.func(x_new);
      M = max(M, norm(g_new - g)/norm_p); % as the approximation of local L within set contain (x_k, x_{k+1})
      alpha_test = min(alpha0, 1/M) ;
      if f_new > f - alpha_test/2*norm_g^2;
          % M is a bad approximation of L, try smaller region
          alpha0 = self.gamma*alpha0;
      else
          % M is a valid approximation of L, return it
          stepsize = alpha_test;
          break
      end
  end

end

