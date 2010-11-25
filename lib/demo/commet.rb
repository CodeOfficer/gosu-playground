module Demo
	class Commet
		def initialize(window)
			@window = window
			@image = Gosu::Image.new(@window, "assets/smiley.png", false)
			@x = rand(@window.width) + 1
			@y = 0
			@vel_x = rand(45).to_f
			@vel_y = 30.0
			@angle = 180.00
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
			@image.draw_rot(@x, @y, ZOrder::Commet, 0)
		end

	end
end