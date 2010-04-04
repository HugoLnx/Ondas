class Janela < Gosu::Window
	attr_writer :error_text
	attr_reader :font, :font_color
	attr_accessor :onda
	def initialize
		super(500,310,false)
		self.caption = 'Trabalho de Ondas by HugoLnx'
		
		@cor_de_fundo = Gosu::Color.new(255,221,237,254)
		
		@cursor = Gosu::Image.new(self, "Cursor.png", false)
		
		@font = Gosu::Font.new(self, Gosu::default_font_name,20)
		@font_color = Gosu::Color::BLACK
		
		@container_desenho = ContainerDesenho.new(self)
		
		@container_entrada = ContainerEntrada.new(self)
		
		@error_text = ''
	end
	
	def draw
		desenha_fundo
		@container_desenho.draw
		@container_entrada.draw
		@font.draw(@error_text,@container_desenho.x,
			@container_desenho.y + @container_desenho.height,
			0,1,1,Gosu::Color::RED)
		@cursor.draw(self.mouse_x, self.mouse_y, 0)
	end
	
	def desenha_fundo
		desenha_retangulo(0,0,self.width,self.height,@cor_de_fundo)
	end
	
	def desenha_retangulo(x,y,w,h,cor)
		self.draw_quad(x,y,cor ,x+w,y,cor ,x+w,y+h,cor ,x,y+h,cor)
	end
	
	def desenha_ponto_da_onda(x,y,altura,cor)
		self.desenha_retangulo(x,y,1,altura,cor)
	end
	
	def update
		@container_entrada.update
	end
	
	def button_down(id)
		@error_text = ''
		#if id == Gosu::KbTab then
		#	# Tab key will not be 'eaten' by text fields; use for switching through
		#	# text fields.
		#	index = @text_fields.index(self.text_input) || -1
		#	self.text_input = @text_fields[(index + 1) % @text_fields.size]
		#if id == Gosu::KbEscape then
		#	# Escape key will not be 'eaten' by text fields; use for deselecting.
		#	if self.text_input then
		#	self.text_input = nil
		#	else
		#	close
		#	end
		if id == Gosu::MsLeft
			# Mouse click: Select text field based on mouse position.
			@container_entrada.lmouse_click
		end
	end
	
end