class MicroondasUnidade
  def aquecer_por(segundos)
    puts "Aquecendo por #{segundos} segundos..."
    sleep(1)
    puts 'Processo concluído.'
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail enviado às #{@hora_envio}: #{@conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmails = []
  end

  def enviar_dmail
    print 'Digite o conteúdo do D-Mail: '
    conteudo = gets.chomp
    print 'Digite a hora de envio (ex: 10:30): '
    hora = gets.chomp
    @unidade.aquecer_por(5)
    dmail = DMail.new(conteudo, hora)
    @dmails << dmail
    puts 'D-Mail enviado com sucesso!'
  end

  def listar_dmails(horario_corte)
    recentes = @dmails.select { |d| d.hora_envio > horario_corte }
    if recentes.empty?
      puts 'Nenhum D-Mail encontrado após esse horário.'
    else
      puts 'D-Mails após o horário informado:'
      recentes.each { |d| puts d }
    end
  end
end

telefone = TelefoneDeMicroondas.new
telefone.enviar_dmail
print 'Digite um horário de corte (ex: 09:00): '
horario_corte = gets.chomp
telefone.listar_dmails(horario_corte)
