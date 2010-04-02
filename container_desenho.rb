class ContainerDesenho < Container

	def inicializa
		@x,@y = 15, 15
		@width, @height = 470,200
		@cor = Gosu::Color::WHITE
	end
	
	def draw
		@janela_pai.desenha_retangulo(@x,@y,@width,@height,@cor)
	end
end