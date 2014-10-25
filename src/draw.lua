function love.draw()
	for i=1,#particles do
		love.graphics.setColor(particles[i].getColor())
		love.graphics.circle("fill", particles[i].getX(), particles[i].getY(), particles[i].getRadius())
	end

	love.graphics.setColor(255,255,255)
	love.graphics.print(love.timer.getAverageDelta(), 1, 1)
	love.graphics.print(Particle.seed, 1, 13)
end
