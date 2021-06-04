function lb = liebracket(gi, gj, vars)
% The lie bracket function
% computes [gi, gj]
% gi - a vector
% gj - a vector
% vars - the variables for the jacobian
% returns [gi, gj]
%
% written by: Dimitri Lezcano

    lb = jacobian(gj,vars)*gi - jacobian(gi,vars)*gj;

end

