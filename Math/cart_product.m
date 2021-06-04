%% product
% 
% implement cartesian product between multiple vectors
%
% - written by: Dimitri Lezcano


function prod = cart_product(varargin)
    prod = varargin{1};
    
    for i = 2:length(varargin)
        prod = cart_product2(prod, varargin{i});
        
    end
end


function prod = cart_product2(A, B)
    [b, a] = ndgrid(1:size(B, 1), 1:size(A, 1));
    
    a = reshape(a, [], 1);
    b = reshape(b, [], 1);
    
    prod = [A(a,:), B(b,:)];

end