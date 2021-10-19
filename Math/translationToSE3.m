%% translationToSE3.m
% - written by: Dimitri Lezcano
% 
% Turn a rotation matrix into a 4x4 SE(3) matrix
%
% Args:
%   - t: 3x1 translation vector
%
% Returns:
%   - 4x4 SE(3) matrix

function F = translationToSE3(t)
    arguments
        t (3,1);
    end
    
    F = makeSE3(eye(3), t, 'Check', false);
    
end
    