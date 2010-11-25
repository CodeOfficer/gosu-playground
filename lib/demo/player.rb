module Demo
	class Player
		def initialize(window)
			@window = window
			@image = Gosu::Image.new(@window, "assets/iDOTu.png", false)
			@x = @y = @vel_x = @vel_y = @angle = 0.0
		end

		def warp(x, y)
			@x, @y = x, y
		end

		def turn_left
			@angle -= 4.5
		end

		def turn_right
			@angle += 4.5
		end

		def accelerate
			@vel_x += Gosu::offset_x(@angle, 0.5)
			@vel_y += Gosu::offset_y(@angle, 0.5)
		end

		def move
			@x += @vel_x
			@y += @vel_y
			@x %= @window.width
			@y %= @window.height
			@vel_x *= 0.95
			@vel_y *= 0.95
		end

		def draw
			@image.draw_rot(@x, @y, ZOrder::Player, @angle)
		end

	end
end