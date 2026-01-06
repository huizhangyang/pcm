function value = getoptions(options, name, defaultvalue)
% function value = getoptions(options, name, defaultvalue)

fields = fieldnames(options);
found = strcmpi(name,fields);
if any(found)
    value = options.(fields{found});
    if isempty(value)
        value = defaultvalue;
    end
else
    value = defaultvalue;
end