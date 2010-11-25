module Demo
	class Gun
		def initialize(window, tower)
			@window = window
			@tower = tower
			@x = @tower.x
			@y = @tower.y
			@angle = 0.0
		end

		def turn_left
			@angle -= 4.5
		end

		def turn_right
			@angle += 4.5
		end

		def move
		end

		def draw
			@window.draw_line(@x, @y, 0xcc666666, @x+20, @y+20, 0xccff6666, ZOrder::Gun)
		end

	end
end