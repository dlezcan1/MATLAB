function Rx = solveRx(alphas, betas)
% alphas: A 3xN matrix representing the skew symmetric matrices. 
% betas: A 3xN matrix representing the skew symmetric matrices.
% return: The least squares solution to the matrix Rx: alphas * Rx = betas

    Rx = alphas \ betas;
    
    size(alphas)
    size(betas)
    disp("Error in Rx:"); disp(alphas - betas*Rx');
    
end