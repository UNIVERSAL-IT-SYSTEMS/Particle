function beginContact(a, b, c)
	if a:getShape():type() == "CircleShape" and b:getShape():type() == "CircleShape" then
		contacts[#contacts + 1] = a:getBody()
		contacts[#contacts + 1] = b:getBody()
	end
end

function endContact(a, b, c)
	--[[
	local m = a:getBody()
	local n = b:getBody()
	--local joint = love.physics.newDistanceJoint(m, n, m:getX(), m:getY(), n:getX(), n:getY(), false)
	--jointsToCreate[#jointsToCreate + 1] = 
	--contacts.insert(m)
	--contacts.insert(n)
	contacts[#contacts + 1] = m
	contacts[#contacts + 1] = n]]
end

function preSolve(a, b, c)
	-- body
end

function postSolve(a, b, c, normImpulse1, tanImpulse1, normImpulse2, tanImpulse2)
	-- body
	--[[local m = a:getBody()
	local n = b:getBody()
	local joint = love.physics.newDistanceJoint(m, n, m:getX(), m:getY(), n:getX(), n:getY())]]
	--[[contacts[#contacts + 1] = a:getBody()
	contacts[#contacts + 1] = b:getBody()]]
end
