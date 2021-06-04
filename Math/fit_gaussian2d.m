%% fit_gaussian.m
%
% this is a function to fit a 2-D gaussian
%
% - written by: Dimitri Lezcano

function [mu, sigma, C] = fit_gaussian2d(X, Y, f)
    % Args:
    %   X, Y: the x and y coordinates in gridded format
    %      f: the values of the pdf in gridded format
    % Return:
    %     mu: the average [x; y] of the gaussian
    %  sigma: the covariance matrix
    %      C: the scale of the Gaussian
    
    %% calculate mean
    mu_x = sum(f .* X, 'all')/sum(f, 'all');
    mu_y = sum(f .* Y, 'all')/sum(f, 'all');
    mu = [mu_x; mu_y];
    
    %% calculate integration constant
    C = interp2(X, Y, f, mu_x, mu_y, 'spline');

    %% calculate the covariance matrix
    % zero-centered positions
    dX = X - mu_x;
    dY = Y - mu_y;
    
    % vectorize the points
    dX_v = reshape(dX, [], 1);
    dY_v = reshape(dY, [], 1);
    f_v = reshape(f, [], 1);
    
    % remove any singular values from f_v
    idxs = find(f_v > 5e-12);
    dX_v = dX_v(idxs);
    dY_v = dY_v(idxs);
    f_v = f_v(idxs);
    
    % calculate A matrix for least squares
    A = - [ dX_v.^2, 2.*dX_v.*dY_v, dY_v.^2]/2;
    b = log(f_v/C);
    
    sig_v = A\b;
    
    sigma_inv = [sig_v(1), sig_v(2); sig_v(2), sig_v(3)];
    sigma = pinv(sigma_inv);
   
    
end
    