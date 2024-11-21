require 'faker'
# Em cada team, criar 22 jogadores com nome, posição(Goleiro, Zagueiro, Lateral, Meio-Campo, Atacante), accuracy, strength, speed, balance e agility aleatórios entre 51 e 99 e price proporcional a soma dos atributos dividido por 5 vezes 9,87

8.times do |i|
  team = Team.create!(name: "Team #{i + 1}")
 
 
  22.times do
    name = Faker::Name.name
    position = ["Goleiro", "Zagueiro", "Lateral", "Meio-Campo", "Atacante"].sample
    accuracy = rand(51..99)
    strength = rand(51..99)
    speed = rand(51..99)
    balance = rand(51..99)
    accuracy = rand(51..99)
    agility = rand(51..99)
 
 
    # Supondo que a variável `position` contenha a posição do jogador
    case position
    when 'Goleiro'
      price = agility * 51 + strength * 15 + speed * 15 + balance * 15 + accuracy * 15
    when 'Zagueiro'
      price = strength * 51 + balance * 15 + agility * 15 + accuracy * 15 + speed * 15
    when 'Lateral'
      price = speed * 51 + balance * 15 + agility * 15 + accuracy * 15 + strength * 15
    when 'Meio-Campo'
      price = balance * 51 + agility * 15 + accuracy * 15 + strength * 15 + speed * 15
    when 'Atacante'
      price = accuracy * 51 + speed * 15 + agility * 15 + strength * 15 + balance * 15
    end
 
 
    Player.create!(
      name: name,
      position: position,
      accuracy: accuracy,
      strength: strength,
      speed: speed,
      balance: balance,
      agility: agility,
      price: price,
      team: team
    )
  end
 end
 