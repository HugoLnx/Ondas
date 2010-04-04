class Container
	attr_reader :x, :y, :width, :height
	def initialize(janela_pai)
		@janela_pai = janela_pai
		inicializa
	end
	
	def inicializa
		raise 'Esta é uma classe abstrata'
	end
	
	def draw
		raise 'Esta é uma classe abstrata'
	end
end