class Diario {
  #autorSecreto
  constructor(autor) {
    this.#autorSecreto = autor
    this.enigmas = new Map()
  }
  adicionarEnigma(chave, texto) {
    this.enigmas.set(chave, texto)
  }
  decodificar(chave, num, autor) {
    if (autor !== this.#autorSecreto) throw new Error('Acesso negado')
    const enigma = this.enigmas.get(chave)
    if (!enigma) throw new Error('Enigma inexistente')
    const indice = Math.min(num, enigma.length - 1)
    return enigma[indice]
  }
}

class Criatura {
  constructor(nome, perigo) {
    this.nome = nome
    this.perigo = perigo
  }
}

class Protagonista {
  constructor(nome, diario) {
    this.nome = nome
    this.diario = diario
  }
  consultarDiario(chave, indice) {
    return this.diario.decodificar(chave, indice, this.nome)
  }
}

class Personagem {
  constructor(nome, funcao) {
    this.nome = nome
    this.funcao = funcao
  }
}

class CabanaMisterio {
  constructor() {
    this.funcionarios = []
  }
  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem)
  }
  listarFuncionarios() {
    return this.funcionarios
  }
}

const diario3 = new Diario('Dipper')
diario3.adicionarEnigma('gnomo', 'Pequeno e perigoso')
diario3.adicionarEnigma('barata', 'Enorme e gosmenta')

const dipper = new Protagonista('Dipper', diario3)
console.log(dipper.consultarDiario('gnomo', 3))

const cabana = new CabanaMisterio()
cabana.adicionarFuncionario(new Personagem('Soos', 'Handyman'))
cabana.adicionarFuncionario(new Personagem('Wendy', 'Atendente'))

console.log(cabana.listarFuncionarios())
