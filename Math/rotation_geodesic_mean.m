%% rotation_geodesic_mean.m
%
% "Hartley, R., Trumpf, J., Dai, Y., & Li, H. (2013). Rotation averaging.
%   International Journal of Computer Vision, 103(3), 267–305. 
%   https://doi.org/10.1007/s11263-012-0601-0"
%
%  Args:
%    - R_mat a 3x3xN collection of N SO(3) rotation matrices
%  
%
% - written by: Dimitri Lezcano
function R_mean = rotation_geodesic_mean(R_mat, options)
    arguments
        R_mat (3,3,:);
        options.Tolerance double {mustBePositive} = 1e-5;
        options.MaxLoops double {mustBePositive, mustBeInteger} = 200;
        options.Verbose logical = false;
    end
    
    %% Check for SO(3)
    for i = 1:size(R_mat,3)
        assert(isso(R_mat(:,:,i)));
    end
    
    
    %% Iterative Updating
    % Initalize mean values
    R_mean = R_mat(:,:,1);
    
    % looping
    for i = 1:options.MaxLoops
        r = compute_update_r(R_mat, R_mean);
        
        if norm(r) < options.Tolerance && options.Verbose
            disp("Tolerance condition met.");
            break;
        end
        
        R_mean = R_mean * rotationVectorToMatrix(r); % update mean R
    end
    
    if i >= options.MaxLoops && options.Verbose
        disp("Maximum number of loops met.");
    end
    
    
end

%% Helper functions
function r = compute_update_r(R_mat, R_i)
    arguments
        R_mat (3,3,:);
        R_i (3,3);
    end
        
    % average rotation update
    r = zeros(3,1);
    for i = 1:size(R_mat,3)
        r = r + rotationMatrixToVector(R_i' * R_mat(:,:,i))'; 
    end
    r = r/size(R_mat,3);
    
    
end
