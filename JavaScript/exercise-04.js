class IRastreavel {
  rastrearLocal() {
    throw new Error('Deve implementar rastrearLocal()')
  }
}

class Hunter extends IRastreavel {
  constructor(nome) {
    super()
    this.nome = nome
  }
}

class Especialista extends Hunter {
  constructor(nome, habilidade) {
    super(nome)
    this.habilidade = habilidade
  }
  rastrearLocal() {
    console.log(`${this.nome} detecta energias únicas usando ${this.habilidade}`)
  }
}

class Manipulador extends Hunter {
  constructor(nome, alvo) {
    super(nome)
    this.alvo = alvo
  }
  rastrearLocal() {
    console.log(`${this.nome} rastreia e controla ${this.alvo} para localizar ameaças`)
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Set()
  }
  adicionarHunter(hunter) {
    for (const h of this.hunters) if (h.nome === hunter.nome) return
    this.hunters.add(hunter)
  }
  rastrearTodos() {
    for (const h of this.hunters) h.rastrearLocal()
  }
}

const batalhao = new Batalhao()

const kuroro = new Especialista('Chrollo', 'Furto de Habilidades')
const killua = new Manipulador('Killua', 'Agilidade e Eletricidade')
const illumi = new Manipulador('Illumi', 'Agulhas e Marionetes')
const duplicado = new Especialista('Killua', 'Outra técnica secreta')

batalhao.adicionarHunter(kuroro)
batalhao.adicionarHunter(killua)
batalhao.adicionarHunter(illumi)
batalhao.adicionarHunter(duplicado)

batalhao.rastrearTodos()
