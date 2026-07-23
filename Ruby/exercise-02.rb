class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, 'Este método deve ser implementado pelas subclasses'
  end

  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} toca '#{peca}' ao piano com delicadeza."
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} interpreta '#{peca}' ao violino com paixão."
  end
end

class Maestro
  def initialize(nome)
    @nome = nome
    @musicos = []
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_ensaio(peca)
    puts "Maestro #{@nome} levanta a batuta para iniciar '#{peca}'."
    @musicos.each { |m| m.tocar_partitura(peca) }
  end

  def mudar_foco(estado)
    @musicos.map { |m| "#{m.nome} agora está #{estado}!" }
  end
end

maestro = Maestro.new('Sebastian')
maestro.adicionar_musico(Pianista.new('Kousei', 'Piano'))
maestro.adicionar_musico(Violinista.new('Kaori', 'Violino'))

print 'Nome da peça para o ensaio: '
peca = gets.chomp
maestro.iniciar_ensaio(peca)

puts '\nMudança de foco:'
puts maestro.mudar_foco('Concentrado')
