%% fit_rot2d.m
% - written by: Dimitri Lezcano
%
% this is a function in order to determine an optimal 2D rotation matrix
%
% Computes
%   argmin fro(R * A - B)^2
%     R                   
% Args:
%   A: 2 x N points
%   B: 2 x N ponits
%
% Return:
%    - 2x2 Rotation matrix

%% function
function R = fit_rot2d(A, B)
    arguments
        A (2,:);
        B (2,:);
    end
    
    %% compute the SVD of the B A^T
    [U, ~, V] = svd(B * A');
    
    R = U * V';
    
    if det(R) < 0
        R(:,end) = -R(:,end);
    end
    
end
    
    


