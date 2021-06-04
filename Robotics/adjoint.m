function Adg = adjoint(g)

% the function accepts a 4x4 homogeneous matrix and returns the
% corresponding 6x6 adjoint matrix 

[rows, cols] = size(g);
    if ((rows ~= 4) || (cols ~= 4))
        error('ADJOINT requires a 4x4 matrix argument.');
    end

R = g(1:3,1:3);
p = g(1:3,4);
p_hat = SKEW3(p);

Adg = [R p_hat*R;
       zeros(3) R];

end