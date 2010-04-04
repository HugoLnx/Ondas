class ContainerEntrada < Container
	attr_reader :text_fields, :submit_btn
	def inicializa
		@x,@y = 15,235
		@width, @height = 470,70
		@text_fields = {}
		@font = @janela_pai.font
		@font_color = @janela_pai.font_color
		largura_campo = 100
		@text_fields[:amplietude] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:lambda] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:velocidade] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:periodo] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@text_fields[:frequencia] = CampoTexto.new(@janela_pai,@font,largura_campo)
		@submit_btn = Button.new(@janela_pai,'Criar Onda',
		Gosu::Color::BLUE,Gosu::Color::YELLOW,@font,3) do
			amp_s = @text_fields[:amplietude].text
			lam_s = @text_fields[:lambda].text
			vel_s = @text_fields[:velocidade].text
			per_s = @text_fields[:periodo].text
			freq_s = @text_fields[:frequencia].text
			
			amp = amp_s.empty? ? nil : amp_s.to_f
			lam = lam_s.empty? ? nil : lam_s.to_f
			vel = vel_s.empty? ? nil : vel_s.to_f
			per = per_s.empty? ? nil : per_s.to_f
			freq = freq_s.empty? ? nil : freq_s.to_f
			begin
				onda = Onda.new(:amplietude => amp,
							:lambda => lam,
							:velocidade => vel,
							:periodo => per,
							:frequencia => freq)
				@janela_pai.onda = onda
			rescue OndaException => erro
				case erro.message
				when :FaltaDados
					@janela_pai.error_text = 'Faltam dados'
				when :SemAmplietude
					@janela_pai.error_text = 'E necessario que se preencha a amplietude'
				when :DadosIncorretos
					@janela_pai.error_text = 'Essa onda nao pode existir'
				end
			end
		end
	end
	
	def draw
		nome = 'Amplietude'
		x = @x
		y = @y
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:amplietude].draw(x+largura_texto+5,y)
		
		nome = 'Lambda'
		y += 21
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:lambda].draw(x+largura_texto+5,y)
		
		nome = 'Velocidade'
		y += 21
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:velocidade].draw(x+largura_texto+5,y)
		
		
		nome = 'Periodo'
		x += 230
		y = @y
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:periodo].draw(x+largura_texto+5,y)
		
		nome = 'Frequencia'
		y += 21
		@font.draw(nome,x,y,0,1,1,@font_color)
		largura_texto = @font.text_width(nome)
		@text_fields[:frequencia].draw(x+largura_texto+5,y)
		
		y += 21
		x = @x + @width - @submit_btn.width
		y = @y + @height - @submit_btn.height
		@submit_btn.draw(x,y)
	end
	
	def lmouse_click
		@submit_btn.lmouse_click
		@janela_pai.text_input = @text_fields.values.find{ |tf| tf.mouse_over? }
	end
	
	def update
		@submit_btn.update
	end
end