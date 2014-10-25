function love.load()
	love.math.setRandomSeed(os.time())

	require "Generate"

	Generate()

	require "update"
	require "draw"

	contacts = {}
end
