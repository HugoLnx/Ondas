class CampoTexto < Gosu::TextInput
	# Some constants that define our appearance.
	INACTIVE_COLOR  = 0xcc666666
	ACTIVE_COLOR    = 0xccff6666
	SELECTION_COLOR = 0xcc0000ff
	CARET_COLOR     = 0xffffffff
  
	def initialize(janela_pai, font,largura_campo)
		# TextInput's constructor doesn't expect any arguments.
		super()

		@janela_pai, @font, @largura_campo = janela_pai, font, largura_campo

		# Start with a self-explanatory text in each field.
		self.text = ""
	end
  
	# Example filter method. You can truncate the text to employ a length limit (watch out
	# with Ruby 1.8 and UTF-8!), limit the text to certain characters etc.
	def filter caracter
		caracter if /[0-9|\.]/.match caracter
	end
  
	def draw(x,y)
		@x = x
		@y = y
		self.text = self.text.gsub(/.$/,'') if @font.text_width(self.text) >= @largura_campo - 1
		# Depending on whether this is the currently selected input or not, change the
		# background's color.
		if @janela_pai.text_input == self then
			background_color = ACTIVE_COLOR
		else
			background_color = INACTIVE_COLOR
		end

		@janela_pai.desenha_retangulo(@x,@y,@largura_campo,self.height,background_color)

		# Calculate the position of the caret and the selection start.
		pos_x = @x + @font.text_width(self.text[0...self.caret_pos])
		sel_x = @x + @font.text_width(self.text[0...self.selection_start])

		# Draw the caret; again, only if this is the currently selected field.
		if @janela_pai.text_input == self then
			@janela_pai.draw_line(pos_x, @y,          CARET_COLOR,
					pos_x, @y + height, CARET_COLOR, 0)
		end

		# Finally, draw the text itself!
		@font.draw(self.text, @x, @y, 0)
	end
  
	def height
		@font.height
	end

  # Hit-test for selecting a text field with the mouse.
	def under_point?(mouse_x, mouse_y)
		mouse_x > @x and mouse_x < @x + @largura_campo and
		mouse_y > @y and mouse_y < @y + height
	end
end