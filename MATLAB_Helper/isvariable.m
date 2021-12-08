%% isvariable.m
% checks whether the table contains a specific variable name
%
% Args:
%    - T: table
%    - s: character array or string of the variable/column to check for
%
function isavariable = isvariable(T, var)
    arguments
        T table;
        var string;
    end
    
    isavariable = ismember(var, act_result_tbl.Properties.VariableNames);
    
end