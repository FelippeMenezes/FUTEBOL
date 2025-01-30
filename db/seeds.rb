require 'faker'

# Configura a localidade para português do Brasil
Faker::Config.locale = 'pt-BR'

apelido = ['Paraíba', 'Ceará', 'Baiano', 'Piauí', 'Pará', 'Paulista', 'Carioca',
          'Mineiro', 'Capixaba', 'Gaúcho', 'Cabeção', 'Maradona', 'Pelézinho',
          'Capeta', 'Matador', 'Gol','Sheik', 'Fenômeno','Imperador', 'Dentinho',
          'Barriga', 'Cacháça', 'Careca', 'Fofão', 'Xuxa', 'Ganso', 'Love', 'Ratão',
          'Furacão', 'Chorão', 'Animal', 'Cazuza', 'Playmobil', 'Shrek', "Bola de Fogo",
          'Zóio', 'Pit Bull', 'Show','Chinelinho', 'Pombo', 'Alemão', 'Loco' ]

8.times do |i|
  team_name = Faker::Sports::Football.team
  while Team.exists?(name: team_name)
    team_name = Faker::Sports::Football.team
  end
  team = Team.create!(name: team_name)

  positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
  positions.each do |position|
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
    while Player.exists?(name: name)
      name = "#{Faker::Name.male_first_name} #{apelido.pop}"
    end
    level = rand(6..10)
    yellow_card = 0
    red_card = 0
    goal_scored = 0
    injury = false
    price = level * 8989

    Player.create!(
      name: name,
      position: position,
      level: level,
      yellow_card: yellow_card,
      red_card: red_card,
      injury: injury,
      goal_scored: goal_scored,
      price: price,
      team: team
    )
  end
end

#Criar 16 jogadores para sem time, sendo 4 deles na posição de goleiro, 4 na posição de atacante, 4 na posição de meia e 4 na posição de defensor
positions = ["G"] * 4 + ["D"] * 4 + ["M"] * 4 + ["A"] * 4
positions.each do |position|
  name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(25..30)
  yellow_card = 0
  red_card = 0
  goal_scored = 0
  injury = false
  price = level * 8989

  Player.create!(
    name: name,
    position: position,
    level: level,
    yellow_card: yellow_card,
    red_card: red_card,
    injury: injury,
    goal_scored: goal_scored,
    price: price
  )
end