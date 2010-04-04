class ContainerDesenho < Container

	def inicializa
		@x,@y = 15, 15
		@width, @height = 470,200
		@cor = Gosu::Color::WHITE
	end
	
	def draw
		@janela_pai.desenha_retangulo(@x,@y,@width,@height,@cor)
		if !@janela_pai.onda.nil?
			desenha_onda(@janela_pai.onda,@x,@y + @height/2,Gosu::Color::BLACK)
		end
		
	end
	
	def desenha_onda(onda,x,y,cor)
		sec = onda.now
		
		@width.times do |i|
			pi = Math::PI
			des_y = onda.amp * Math.sin((2*pi*(i-sec*onda.vel)).to_f/onda.lam)
			@janela_pai.desenha_ponto_da_onda(x+i,y+des_y,onda.altura_ponto,cor)
		end
	end
end