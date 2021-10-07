%% rot2d.m
% - written by: Dimitri Lezcano
%
% function to get 2D rotation from a radian angle value
%
% Args: 
%    - theta: radian value of the angle
%
% Returns:
%   - SO(2) rotation matrix

%% Function
function R = rot2d(theta)
    arguments
        theta double;
    end
    
    R = [cos(theta) -sin(theta);
         sin(theta) cos(theta)];
     
end