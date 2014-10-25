require "copy"

--local fakeWorld = love.physics.newWorld(0, 0, true)
local Particles = {}

Particle = {}
Particle.__index = Particle
Particle.seed = os.time()
Particle.rand = love.math.newRandomGenerator(Particle.seed)

function Particle.new(atom,x,y)
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
		return Particles[atom]
	end

	local self = {
		--
	}

	local color = {math.floor(Particle.rand:random(0, 255)), math.floor(Particle.rand:random(0, 255)), math.floor(Particle.rand:random(0, 255))}
	local shape = love.physics.newCircleShape(Particle.rand:random(1, 5))
	--local body = love.physics.newBody(fakeWorld, 0, 0, "dynamic")
	local body = love.physics.newBody(world, atom * 10 - love.graphics.getWidth(), atom * 10 - love.graphics.getHeight(), "dynamic") --temporary / may be bad, supposed to keep them out of the actual sim
	local fixture = love.physics.newFixture(body, shape)

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

	Particles[atom] = self
	return self
end

--Particle.__call(atmo,x,y) = Particle.init(atom,x,y)
