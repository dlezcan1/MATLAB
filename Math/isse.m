%% isse.m
% - written by: Dimitri Lezcano
% 
% function to check whether a 4x4 matrix is SE(n)
%
% Args:
%   - F: (n+1)x(n+1) matrix
%   
% Returns:
%    - logical on whether F is SE(n)

%%
function isSEn = isse(F)
    arguments
        F (:,:) {mustBeSquare};
    end
    
    %% Unpack F
    R = F(1:end-1,1:end-1);
    
    %% Check if Rotation is SO
    isSOn = isso(R);
    
    %% Check for bottom row of zeros and a single 1
    bottom_row_check = all(F(end,1:end-1) == 0) && (F(end,end) == 1);
    
    %% Check for both conditions
    isSEn = isSOn && bottom_row_check;
end

    