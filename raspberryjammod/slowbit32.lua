-- These are super slow 32-bit operations --

local two31 = 2^31
local two32 = 2^32

local to_binary = function(x)
	local pos = two31
	local a = ""
	if x < 0 then	
		x = x + two32
	end
	x = x % two32
	for i=1,32 do
		if x >= pos then
			a = a .. "1"
			x = x - pos
		else
			a = a .. "0"
		end
		pos = pos / 2
	end
	return a
end

local from_binary = function(x)
	local z = tonumber(x)
	if z >= two31 then
		return z - two32
	else
		return z
	end
end


local band = function(...)
	local a = {}
	local arg = {...}
	for i = 1,#arg do
		a[i] = to_binary(arg[i])
	end
	local c = ""
	for i = 1,32 do
		local value = true
		for j = 1,#arg do
			if a[j]:sub(i,i) == "0" then
				value = false
				break
			end
		end

		if value then
			c = c .. "1"
		else
			c = c .. "0"
		end
	end
	return from_binary(c)
end

local bor = function(...)
	local a = {}
	local arg = {...}
	for i = 1,#arg do
		a[i] = to_binary(arg[i])
	end
	local c = ""
	for i = 1,32 do
		local value = false
		for j = 1,#arg do
			if a[j]:sub(i,i) == "1" then
				value = true
				break
			end
		end

		if value then
			c = c .. "1"
		else
			c = c .. "0"
		end
	end
	return from_binary(c)
end

local bxor = function(...)
	local a = {}
	local arg = {...}
	for i = 1,#arg do
		a[i] = to_binary(arg[i])
	end
	local c = ""
	for i = 1,32 do
		local value = false
		for j = 1,#arg do
			if a[j]:sub(i,i) == "1" then
				value = not value
			end
		end

		if value then
			c = c .. "1"
		else
			c = c .. "0"
		end
	end
	return from_binary(c)
end


local bnot = function(x)
	local a = to_binary(x)
	local c = ""
	for i = 1,32 do
		if a:sub(i,i) == "0" then
			c = c .. "1"
		else
			c = c .. "0"
		end
	end
	return from_binary(c)
end

local lshift = function(x,n)
	return (x * 2^n) % two32
end

local rshift = function(x,n)
	return math.floor(x / 2^n)
end

local rol = function(x,n)
	local a = to_binary(x)
	for i = 1,n do
		a = a:sub(2,32) .. a:sub(1,1)
	end
	return from_binary(a)
end

return {rol=rol, bxor=bxor, bor=bor, band=band, bnot=bnot, lshift=lshift, rshift=rshift}
