function mustBeSquare(A)
    arguments
        A (:,:);
    end
    
    if size(A,1) ~= size(A,2)
        eid = 'Size:notEqual';
        msg = 'Input must be a square matrix.';
        throwAsCaller(MException(eid,msg))
    end

end