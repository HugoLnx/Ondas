class OndaException< Exception;end
class Onda
	attr_accessor :vel,:freq,:lam,:per,:amp,:start_time,:altura_ponto
	def initialize(dados={})
		checa_se_e_possivel_definir_a_onda_com_os dados
		
		@vel = dados[:velocidade]
		@freq = dados[:frequencia]
		@lam = dados[:lambda]
		@per = dados[:periodo]
		@amp = dados[:amplietude]
		@start_time = Gosu.milliseconds
		@altura_ponto = @amp/(@lam/16)
		@altura_ponto = 3 if @altura_ponto < 3
		
		calcular_outras_propriedades
		
		checa_se_a_onda_e_possivel
		
		checa_se_a_onda_e_possivel
	end
	
	def checa_se_e_possivel_definir_a_onda_com_os(dados)
		raise OndaException,:SemAmplietude if dados[:amplietude].nil?
		num_dados = 0
		num_dados += 1 if !dados[:velocidade].nil?
		num_dados += 1 if !dados[:lambda].nil?
		num_dados += 1 if !dados[:frequencia].nil? or !dados[:periodo].nil?
		raise OndaException,:FaltaDados if num_dados < 2
	end
	
	def calcular_outras_propriedades
		@freq = 1/@per if !@per.nil? and @freq.nil?
		@freq = @vel/@lam if @freq.nil?
		@vel = @lam*@freq if @vel.nil?
		@lam = @vel / @freq if @lam.nil?
		@per = 1/@freq if @per.nil?
	end
	
	def checa_se_a_onda_e_possivel
		raise OndaException, :DadosIncorretos if @vel != @lam*@freq or @freq != 1/@per
	end
	
	def now

		(Gosu.milliseconds - @start_time)/1000
	end
end