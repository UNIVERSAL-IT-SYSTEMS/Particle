function copy(original)
	local Type = type(original)
	local new
	if Type == 'table' then
		new = {}
		for key,value in next, original, nil do
			new[copy(key)] = copy(value)
		end
		setmetatable(new, copy(getmetatable(original)))
	else
		new = original
	end
	return new
end
