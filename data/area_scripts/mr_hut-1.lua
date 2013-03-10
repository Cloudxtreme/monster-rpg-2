music = "Muttrace.ogg"

local count = 0
local scene_started = false


function do_tint()
	set_music_volume(0)
	tint(60, 60, 60, 0)
	loadPlayDestroy("sleep.ogg")
end

function undo_tint()
	reverse_tint(60, 60, 60, 0)
end

function done()
	setObjectDirection(0, DIRECTION_SOUTH)
	reviveAllPlayers()
	scene_started = false
	set_music_volume(1)
	descriptifyPlayer()
end

function start()
	out = Portal:new{x=3, y=7}
end

function stop()
end

function update(step)
	if (count == 1) then
		local px, py = getObjectPosition(0)
		eny = Object:new{id=0, x=px, y=py, person=true}
		stopObject(0)
		scriptifyPlayer()
		eny.scripted_events = {
			{ event_type=EVENT_WALK, dest_x=3, dest_y=3 },
			{ event_type=EVENT_CUSTOM, callback=do_tint },
			{ event_type=EVENT_GESTURE, name="sleep_floor" },
			{ event_type=EVENT_REST, delay=6000 },
			{ event_type=EVENT_CUSTOM, callback=undo_tint },
			{ event_type=EVENT_CUSTOM, callback=done },
		}
		scene_started = true
	end

	if (scene_started) then
		eny:update(step)
	end

	count = count + 1

	if (out:update()) then
		change_areas("Muttrace", 8, 20, DIRECTION_SOUTH)
	end
end

function activate(activator, activated)
end

function collide(id1, id2)
end

