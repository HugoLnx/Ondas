class Janela < Gosu::Window
	def initialize
		super(500,300,false)
		self.caption = 'Trabalho de Ondas by HugoLnx'
		
		@cor_de_fundo = Gosu::Color.new(255,221,237,254)
		
		@cursor = Gosu::Image.new(self, "Cursor.png", false)
		
		@container_desenho = ContainerDesenho.new(self)
		
		@container_entrada = ContainerEntrada.new(self)
	end
	
	def draw
		desenha_fundo
		@container_desenho.draw
		@container_entrada.draw
		@cursor.draw(self.mouse_x, self.mouse_y, 0)
	end
	
	def desenha_fundo
		desenha_retangulo(0,0,self.width,self.height,@cor_de_fundo)
	end
	
	def desenha_retangulo(x,y,w,h,c)
		self.draw_quad(x,y,c ,x+w,y,c ,x+w,y+h,c ,x,y+h,c)
	end
	
	def button_down(id)
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
			self.text_input = @container_entrada.text_fields.values.find{ |tf| tf.under_point?(self.mouse_x, self.mouse_y) rescue false }
		end
	end
end