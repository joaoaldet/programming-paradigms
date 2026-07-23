class Ataque {
  constructor(nome, poder) {
    this.nome = nome
    this.poder = poder
  }
  executar(atacante, defensor) {
    const dano = Math.max(1, Math.floor(this.poder * (1 + atacante.nivel / 10)))
    defensor.receberDano(dano)
    console.log(`${atacante.nome} usou ${this.nome} em ${defensor.nome} e causou ${dano} de dano.`)
  }
}

class Investida extends Ataque {
  executar(atacante, defensor) {
    const danoBase = Math.floor(this.poder * (1 + atacante.nivel / 12))
    const crit = Math.random() < 0.1
    const dano = crit ? danoBase * 2 : danoBase
    defensor.receberDano(dano)
    console.log(`${atacante.nome} investiu contra ${defensor.nome} e causou ${dano} de dano${crit ? ' (crítico!)' : ''}.`)
  }
}

class Brasa extends Ataque {
  executar(atacante, defensor) {
    const dano = Math.floor(this.poder * (1 + Math.log1p(atacante.nivel)))
    defensor.receberDano(dano)
    if (Math.random() < 0.2 && !defensor.foiQueimado) {
      defensor.foiQueimado = true
      console.log(`${defensor.nome} foi queimado! Vai sofrer dano extra no próximo turno.`)
    }
    console.log(`${atacante.nome} lançou Brasa em ${defensor.nome} e causou ${dano} de dano.`)
  }
}

class JatoDagua extends Ataque {
  executar(atacante, defensor) {
    const dano = Math.floor(this.poder * (1 + atacante.nivel / 15))
    defensor.receberDano(dano)
    const acuracia = Math.random() < 0.95
    console.log(acuracia ? `${atacante.nome} acertou Jato d'Água e causou ${dano} de dano em ${defensor.nome}.` : `${atacante.nome} errou Jato d'Água.`)
  }
}

class Trovao extends Ataque {
  executar(atacante, defensor) {
    const dano = Math.floor(this.poder * (1 + atacante.nivel / 8))
    const paralisa = Math.random() < 0.15
    defensor.receberDano(dano)
    if (paralisa) defensor.paralisado = 1
    console.log(`${atacante.nome} invocou Trovão e causou ${dano} de dano${paralisa ? ' e paralisou!' : ''}.`)
  }
}

class Pokemon {
  #vida
  constructor(nome, nivel, vidaMax, ataque) {
    this.nome = nome
    this.nivel = nivel
    this.maxVida = vidaMax
    this.#vida = vidaMax
    this.ataque = ataque
    this.foiQueimado = false
    this.paralisado = 0
  }
  get vida() {
    return this.#vida
  }
  atacar(alvo) {
    if (this.estaNocauteado()) return console.log(`${this.nome} está nocauteado e não pode atacar.`)
    if (this.paralisado > 0) {
      this.paralisado--
      console.log(`${this.nome} está paralisado e perde o turno.`)
      return
    }
    console.log(`
${this.nome} (PV: ${this.#vida}/${this.maxVida}) ataca ${alvo.nome} (PV: ${alvo.vida}/${alvo.maxVida})`)
    this.ataque.executar(this, alvo)
    if (this.foiQueimado) {
      const danoQueimadura = Math.max(1, Math.floor(this.maxVida * 0.03))
      this.receberDano(danoQueimadura)
      console.log(`${this.nome} sofre ${danoQueimadura} de dano por queimadura.`)
    }
  }
  receberDano(dano) {
    this.#vida = Math.max(0, this.#vida - dano)
    if (this.#vida === 0) console.log(`${this.nome} desmaiou!`)
  }
  curar(valor) {
    this.#vida = Math.min(this.maxVida, this.#vida + valor)
  }
  estaNocauteado() {
    return this.#vida <= 0
  }
}

const charmander = new Pokemon('Charmander', 12, 39, new Brasa('Brasa', 8))
const squirtle = new Pokemon('Squirtle', 11, 44, new JatoDagua('Jato d\'Água', 7))
const pikachu = new Pokemon('Pikachu', 13, 35, new Trovao('Trovão', 9))
const bulbasaur = new Pokemon('Bulbasaur', 10, 45, new Investida('Investida', 6))

function mostrarEstado(...pokemons) {
  console.log('\n--- Estados ---')
  pokemons.forEach(p => console.log(`${p.nome}: ${p.vida}/${p.maxVida} PV`))
  console.log('--------------\n')
}

mostrarEstado(charmander, squirtle, pikachu, bulbasaur)

charmander.atacar(squirtle)
squirtle.atacar(charmander)
pikachu.atacar(bulbasaur)
bulbasaur.atacar(pikachu)

mostrarEstado(charmander, squirtle, pikachu, bulbasaur)

console.log('Simulação completa')
