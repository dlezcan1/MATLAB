function tx=solveTx( Ra, ta, Rb, tb, Rx )
% Ra: a 3x3xN matrix with all the rotations matrices Rai
% ta: a 3xN matrix with all the translation vectors tai
% Rb: a 3x3xN matrix with all the rotations matrices Rbi
% tb: a 3xN matrix with all the translation vectors tbi
% Rx: the 3x3 rotation matrix Rx
% return: the 3x1 translation vector tx

%% get the A matrix and b vector for A*tx = b
    
    A = []; b = [];
    
    for i = 1:size(Ra,1)
        A = [A; Ra(:,:,i)-eye(3)];
        b = [b; Rx * tb(:,i) - ta(:,i)];

    end
    
%% Perform the least squares fitting
    tx = A\b;
    
    disp("Error in tx"); disp(A*tx - b);
end