class Button
	attr_reader :width, :height, :evt_click
	attr_writer :selected
	def initialize(janela_pai,text,cor_normal,cor_sel,font,padding,&evt_click)
		@janela_pai,@text = janela_pai,text
		@cor_normal,@cor_sel,@font,@padding = cor_normal,cor_sel,font,padding
		@width = @font.text_width(@text) + @padding * 2
		@height = @font.height + @padding * 2
		@selected = false
		@evt_click = evt_click
	end
	
	def draw(x,y)
		@x = x
		@y = y
		cor = @selected ? @cor_sel : @cor_normal
		@janela_pai.desenha_retangulo(x,y,@width,@height,cor)
		@font.draw(@text,x+@padding,y+@padding,0,1,1,Gosu::Color::BLACK)
	end
	
	def lmouse_click
		@evt_click.call if self.mouse_over?
	end
	
	def update
		if mouse_over?
			@selected = true
		else
			@selected = false
		end
	end
	
	def mouse_over?
		mouse_x = @janela_pai.mouse_x
		mouse_y = @janela_pai.mouse_y
		mouse_x > @x and mouse_x < @x + @width and
		mouse_y > @y and mouse_y < @y + @height
	end
end