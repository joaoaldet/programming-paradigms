class IExplorador {
  explorar() {
    throw new Error('Método explorar() precisa ser implementado')
  }
}

class ODM_Gear {
  constructor(modelo) {
    this.modelo = modelo
  }
  impulso() {
    console.log(`Engrenagens ${this.modelo} ativadas. Avanço rápido entre estruturas!`)
  }
}

class Soldado extends IExplorador {
  constructor(nome, odm) {
    super()
    this.nome = nome
    this.odm = odm
  }
  explorar() {
    console.log(`${this.nome} avista o terreno e identifica ameaças.`)
  }
  usarODM() {
    console.log(`${this.nome} usa o equipamento ODM:`)
    this.odm.impulso()
  }
}

class Esquadrao {
  constructor(chefe) {
    this.chefe = chefe
    this.soldados = []
  }
  adicionarSoldado(soldado) {
    if (!(soldado instanceof IExplorador))
      throw new Error('Somente exploradores podem entrar no esquadrão')
    this.soldados.push(soldado)
  }
  missao() {
    console.log(`Esquadrão sob comando de ${this.chefe} parte em missão.`)
    this.soldados.forEach(s => {
      s.explorar()
      s.usarODM()
      console.log('---')
    })
  }
}

const levi = 'Capitão Levi'
const esquadrao = new Esquadrao(levi)

const mikasa = new Soldado('Mikasa Ackerman', new ODM_Gear('Modelo Ágil'))
const eren = new Soldado('Eren Yeager', new ODM_Gear('Modelo Experimental'))
const armin = new Soldado('Armin Arlert', new ODM_Gear('Modelo Tático'))

esquadrao.adicionarSoldado(mikasa)
esquadrao.adicionarSoldado(eren)
esquadrao.adicionarSoldado(armin)

esquadrao.missao()
