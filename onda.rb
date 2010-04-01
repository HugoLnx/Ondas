class OndaException< Exception;end
class Onda
	attr_accessor :vel,:freq,:lam,:per,:amp
	def initialize(dados={})
		checa_se_e_possivel_definir_a_onda_com_os dados
		
		@vel = dados[:velocidade]
		@freq = dados[:frequencia]
		@lam = dados[:lambda]
		@per = dados[:periodo]
		@amp = dados[:amplietude]
		
		calcular_outras_propriedades
	end
	
	def checa_se_e_possivel_definir_a_onda_com_os(dados)
		raise OndaException,'SemAmplietude' if dados[:amplietude].nil?
		num_dados = 0
		num_dados += 1 if !dados[:velocidade].nil?
		num_dados += 1 if !dados[:lambda].nil?
		num_dados += 1 if !dados[:frequencia].nil? || !dados[:periodo].nil?
		raise OndaException,'FaltaDados' if num_dados < 2
	end
	
	def calcular_outras_propriedades
		@freq = 1/@per if !@per.nil? and @freq.nil?
		@vel = @lam*@freq if @vel.nil?
		@lam = @vel / @freq if @lam.nil?
		@per = 1/@freq if @per.nil?
	end
	
end