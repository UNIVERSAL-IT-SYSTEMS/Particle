require "copy"

--local fakeWorld = love.physics.newWorld(0, 0, true)
local Particles = {}

Particle = {}
Particle.__index = Particle
Particle.seed = os.time()
Particle.rand = love.math.newRandomGenerator(Particle.seed)

function Particle.mass(atom)
	local result = Particle.rand:random(atom, 5 * atom) / Particle.rand:random(atom / 1.6, 2 * atom)
	if result <= 0 then
		return 0.01
	else
		return result
	end
end

function Particle.new(atom, x, y)
	-- create atoms that don't already exist to here
	-- this is so the random seed used is consistent no matter what order you "create" the particles
	for i=1,atom-1 do
		if not Particles[i] then
			Particle.new(i)
		end
	end

	-- if specified particle already generated, create a copy
	if Particles[atom] then
		local self = copy(Particles[atom])
		--self.setX(love.math.random(0 + self.getRadius(), love.graphics.getWidth()))
		--self.setY(love.math.random(0 + self.getRadius(), love.graphics.getHeight()))
		self.setX(x)
		self.setY(y)
		--turn off the velociy here
		return self
	end

	local self = {
		--
	}

	local color = {math.floor(Particle.rand:random(0, 255)), math.floor(Particle.rand:random(0, 255)), math.floor(Particle.rand:random(0, 255))}
	local shape = love.physics.newCircleShape(Particle.mass(atom))
	--local body = love.physics.newBody(fakeWorld, 0, 0, "dynamic")
	local body = love.physics.newBody(world, atom * 100 - love.graphics.getWidth(), atom * 100 - love.graphics.getHeight(), "dynamic") --temporary / may be bad, supposed to keep them out of the actual sim
	--body:setBullet(true)
	local fixture = love.physics.newFixture(body, shape)
	fixture:setDensity(Particle.rand:random(0.5 * atom, 2 * atom))
	fixture:setRestitution(Particle.rand:random(math.min(math.floor(atom / 80) + (0.4 * Particle.rand:random(0.9,1.1)), 0.9), 0.99))

	--math.max((atom / 40) * 1.1,0.99)
	-- 0.0275 to 5.5
	-- I want a min of 0.5
	-- 0.5 * atom/100 , ?
	-- 0.5 * 200/100 = 0.5 * 2 = 1
	-- 0.5 * 1/100 = 0.01 * 0.5 = 0.005 (no!)
	-- rand ( math.min( math.floor(atom / 80) + 0.4 , 0.9 ) , 0.99 )

	function self.getX()
		return body:getX()
	end
	function self.getY()
		return body:getY()
	end
	function self.setX(newX)
		body:setX(newX)
	end
	function self.setY(newY)
		body:setY(newY)
	end

	function self.getRadius()
		return shape:getRadius()
	end

	function self.getColor()
		return color[1], color[2], color[3]
	end

	function self.applyForce(fx, fy)
		body:applyForce(fx, fy)
	end

	-- THIS DOES NOT WORK
	function self.delete()
		--fixture:destroy()
		--shape:destroy()
		--body:destroy()
		for i,_ in ipairs(color) do
			color[i] = nil
		end
		for k,_ in pairs(self) do
			self[k] = nil
		end
	end

	Particles[atom] = copy(self)
	return self
end

function Particle.reset()
	Particle.rand = love.math.newRandomGenerator(Particle.seed)
	Particles = {}
end
