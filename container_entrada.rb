class ContainerEntrada < Container
	attr_reader :text_fields
	def inicializa
		@font = Gosu::Font.new(@janela_pai, Gosu::default_font_name,20)
		@font_color = Gosu::Color::BLACK
		@x,@y = 15,235
		@width, @height = 470,70
		@text_fields = {}
		largura_campo = 100
		@text_fields[:amplietude] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:lambda] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:velocidade] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:periodo] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:frequencia] = CampoTexto.new(@janela_pai,@font,largura_campo)
	end
	
	def draw
		nome = 'Amplietude'
		x = @x
		y = @y
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:amplietude].draw(x+largura_texto+5,y)
		
		nome = 'Lambda'
		y = @y+21
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:lambda].draw(x+largura_texto+5,y)
		
		nome = 'Velocidade'
		y = @y+42
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:velocidade].draw(x+largura_texto+5,y)
		
		
		nome = 'Periodo'
		x = @x + 230
		y = @y
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:periodo].draw(x+largura_texto+5,y)
		
		nome = 'Frequencia'
		x = @x + 230
		y = @y + 21
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:frequencia].draw(x+largura_texto+5,y)
	end
end