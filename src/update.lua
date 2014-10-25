function love.update(dt)
	if love.keyboard.isDown('r') then
		Generate()
	end
	if love.keyboard.isDown('q') then
		love.event.quit()
	end
	world:update(dt)

	--love.physics.newDistanceJoint(m, n, m:getX(), m:getY(), n:getX(), n:getY(), false) contacts
	for i=1,#contacts,2 do
		love.physics.newDistanceJoint(contacts[i], contacts[i + 1], contacts[i]:getX(), contacts[i]:getY(), contacts[i + 1]:getX(), contacts[i + 1]:getY(), false)
		contacts[i] = nil
		contacts[i + 1] = nil
	end
end
