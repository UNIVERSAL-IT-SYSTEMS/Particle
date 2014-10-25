function love.load()
	love.math.setRandomSeed(os.time())
	world = love.physics.newWorld(0, 0, true)

	require "Particle"

	particles = {}

	for i=1,25 do
		local x = love.math.random(6, love.graphics.getWidth() - 6)
		local y = love.math.random(6, love.graphics.getHeight() - 6)
		particles[i] = Particle.new(math.floor(love.math.random(1, 200)), x, y)
	end

	local box = {}
	local w,h = love.graphics.getDimensions()

	box.ground = {}
	box.ground.body = love.physics.newBody(world, w/2, 0, "static")
	box.ground.shape = love.physics.newEdgeShape(-w/2, h, w/2, h)
	box.ground.fixture = love.physics.newFixture(box.ground.body, box.ground.shape)
	
	box.roof = {}
	box.roof.body = love.physics.newBody(world, w/2, h, "static")
	box.roof.shape = love.physics.newEdgeShape(-w/2, 0, w/2, 0)
	box.roof.fixture = love.physics.newFixture(box.roof.body, box.roof.shape)

	box.left = {}
	box.left.body = love.physics.newBody(world, 0, h/2, "static")
	box.left.shape = love.physics.newEdgeShape(0, -h/2, 0, h/2)
	box.left.fixture = love.physics.newFixture(box.left.body, box.left.shape)

	box.right = {}
	box.right.body = love.physics.newBody(world, w, h/2, "static")
	box.right.shape = love.physics.newEdgeShape(w, -h/2, w, h/2)
	box.right.fixture = love.physics.newFixture(box.right.body, box.right.shape)
	--[[
		objects.ball.fixture:setRestitution(0.2) -- not very bouncy ball

		love.graphics.setBackgroundColor(104, 136, 248)
	]]
end

function love.update(dt)
	world:update(dt)
end

function love.draw()
	--love.graphics.setColor(193, 47, 14)
	--love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
	for i=1,#particles do
		love.graphics.setColor(particles[i].getColor())
		love.graphics.circle("fill", particles[i].getX(), particles[i].getY(), particles[i].getRadius())
	end

	love.graphics.setColor(255,255,255)
	love.graphics.print(love.timer.getAverageDelta(), 1, 1)
	love.graphics.print(Particle.seed, 1, 13)
end
