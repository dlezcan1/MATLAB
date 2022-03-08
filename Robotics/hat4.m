function xi_hat = hat4(xi)
%HAT4 Summary of this function goes here
%   Detailed explanation goes here

	v = xi(1:3);
    w_hat = skew3(xi(4:end));
    
    xi_hat = [w_hat v; zeros(1,4)];

end

