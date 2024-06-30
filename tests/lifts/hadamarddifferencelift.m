function lift = hadamarddifferencelift(n)
% phi(u, v) = u.^2 - v.^2
% rho(u, v) = norm(u)^2 + norm(v)^2

    lift.M = euclideanfactory(n, 2);
    lift.N = euclideanfactory(n, 1);

    lift.embedded = false;

    lift.phi = @(y) y(:, 1).*y(:, 1) - y(:, 2).*y(:, 2);
    lift.Dphi = @(y, v) 2*y(:, 1).*v(:, 1) - 2*y(:, 2).*v(:, 2);
    lift.Dphit = @(y, u) [2*y(:, 1).*u, - 2*y(:, 2).*u];
    lift.hesshw = @(y, v, w) [2*v(:, 1).*w, -2*v(:, 2).*w];

    lift.rho = @(y) norm(y, 'fro')^2;
    lift.gradrho = @(y) 2*y;
    lift.hessrho = @(y, ydot) 2*ydot;

end