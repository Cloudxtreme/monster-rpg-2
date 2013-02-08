music = "mountains.ogg"

function start()
	portal_up = Portal:new{x=5, y=4}
	portal_down = Portal:new{x=1, y=4}
end

function stop()
end

function update(step)
	portal_up:update()
	portal_down:update()

	if (portal_up.go_time) then
		change_areas("mountain_descent0", 5, 4, DIRECTION_WEST)
	elseif (portal_down.go_time) then
		change_areas("mountain_descent2", 1, 4, DIRECTION_EAST)
	end
end

function activate(activator, activated)
end

function collide(id1, id2)
end

