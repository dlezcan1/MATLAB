function paths = pathsplit(filename)
%PATHSPLIT split a filename into its path elements
    
    paths = regexp(fullfile(filename), filesep, 'split');

end

