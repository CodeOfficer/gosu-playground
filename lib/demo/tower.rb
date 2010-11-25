module Demo
	class Tower
		attr_accessor :x, :y

		def initialize(window)
			@window = window
			@image = Gosu::Image.new(@window, "assets/enemy.png", false)
			@x = rand(@window.width) + 1
			@y = rand(@window.height) + 1
			@angle = 0.0
			@gun = Gun.new(@window, self)
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

		def move
			@gun.move
		end

		def draw
			@image.draw_rot(@x, @y, ZOrder::Tower, @angle)
			@gun.draw
		end

	end
end