module Demo
	class Game < Gosu::Window

		def	initialize(width=800, height=600, fullscreen=false)
			super
			self.caption = "Gosu Demo Game"
			@logger = Logger.new(self)
			@background_image = Gosu::Image.new(self, "assets/background.png", true)
			@player = Player.new(self)
			@player.warp(width/2, height/2)
			@towers = []
			10.times do
				@towers << Tower.new(self)
			end
			@commets = []
		end

		def	button_down(id)
			case id
				when Gosu::KbEscape then close
				when Gosu::MsLeft then spawn_commet
				else #
			end
		end

		def spawn_commet
			@commets << Commet.new(self)
		end

		def	update
			if button_down? Gosu::KbLeft
				say "turning left"
				@player.turn_left
			end
			if button_down? Gosu::KbRight
				say "turning right"
				@player.turn_right
			end
			if button_down? Gosu::KbUp
				say "accelerate"
				@player.accelerate
			end
			@player.move
			@towers.each {|t| t.move}
			@commets.each {|c| c.move}
		end

		def say(msg)
			@logger.say(msg)
		end

		def draw
			@background_image.draw(0, 0, ZOrder::Background)
			@player.draw
			@towers.each {|t| t.draw}
			@commets.each {|c| c.draw}
		end

	end
end