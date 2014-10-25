require "Particle"

function Generate()
	if world then world:destroy() end
	world = love.physics.newWorld(0, 0, true)
	require "physCallbacks"
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	--particles = {}

	if particles then
		for i=1,#particles do
			--particles[i].delete()
			for k,_ in pairs(particles[i]) do
				particles[i][k] = nil
			end
		end
	end
	particles = {}

	Particle.reset()

	for i=1,100 do
		local x = love.math.random(6, love.graphics.getWidth() - 6)
		local y = love.math.random(6, love.graphics.getHeight() - 6)
		particles[i] = Particle.new(math.floor(love.math.random(1, 200)), x, y)
		local fx = love.math.random(-50000, 50000)
		local fy = love.math.random(-50000, 50000)
		particles[i].applyForce(fx, fy)
	end


	local box = {}
	local w,h = love.graphics.getDimensions()

	box.ground = {}
	box.ground.body = love.physics.newBody(world, w/2, 0, "static")
	box.ground.shape = love.physics.newEdgeShape(-w/2, h, w/2, h)
	box.ground.fixture = love.physics.newFixture(box.ground.body, box.ground.shape)
	box.ground.fixture:setRestitution(1)
	
	box.roof = {}
	box.roof.body = love.physics.newBody(world, w/2, 0, "static")
	box.roof.shape = love.physics.newEdgeShape(-w/2, 0, w/2, 0)
	box.roof.fixture = love.physics.newFixture(box.roof.body, box.roof.shape)
	box.roof.fixture:setRestitution(1)

	box.left = {}
	box.left.body = love.physics.newBody(world, 0, h/2, "static")
	box.left.shape = love.physics.newEdgeShape(0, -h/2, 0, h/2)
	box.left.fixture = love.physics.newFixture(box.left.body, box.left.shape)
	box.left.fixture:setRestitution(1)

	box.right = {}
	box.right.body = love.physics.newBody(world, 0, h/2, "static")
	box.right.shape = love.physics.newEdgeShape(w, -h/2, w, h/2)
	box.right.fixture = love.physics.newFixture(box.right.body, box.right.shape)
	box.right.fixture:setRestitution(1)
end
