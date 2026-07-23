module Rastreavel
  def obter_localizacao(hora)
    "Localização registrada às #{hora}: #{@localizacao}"
  end
end

module Perigoso
  def calcular_risco
    rand(50..100)
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
    @localizacao = 'Desconhecida'
  end

  def to_s
    @nome
  end
end

class Detetive < Participante
  include Rastreavel

  def obter_localizacao(hora)
    super(hora)
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def calcular_risco
    nivel = super
    "Nível de risco de #{@nome}: #{nivel}"
  end
end

class Cenario
  def initialize
    @participantes = []
  end

  def adicionar(participante)
    @participantes << participante
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  def exibir_ameacas
    ameaças = identificar_ameacas
    if ameaças.empty?
      puts 'Nenhuma ameaça detectada.'
    else
      puts 'Ameaças identificadas:'
      ameaças.each { |a| puts a.calcular_risco }
    end
  end
end

print 'Localização de Sherlock: '
local_sherlock = gets.chomp
print 'Localização de Moriarty: '
local_moriarty = gets.chomp

sherlock = Detetive.new('Sherlock')
sherlock.localizacao = local_sherlock
moriarty = MestreDoCrime.new('Moriarty')
moriarty.localizacao = local_moriarty

cenario = Cenario.new
cenario.adicionar(sherlock)
cenario.adicionar(moriarty)

puts '\nLocalizações registradas:'
puts sherlock.obter_localizacao('10:00')
puts moriarty.obter_localizacao('10:00')

puts '\nAnálise de ameaças:'
cenario.exibir_ameacas
