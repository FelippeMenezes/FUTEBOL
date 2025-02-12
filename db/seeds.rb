require 'faker'

Faker::Config.locale = 'pt-BR'

apelido = ['Paraíba', 'Ceará', 'Baiano', 'Piauí', 'Pará', 'Paulista', 'Carioca',
          'Mineiro', 'Capixaba', 'Gaúcho', 'Cabeção', 'Maradona', 'Pelézinho',
          'Capeta', 'Matador', 'Gol','Sheik', 'Fenômeno','Imperador', 'Dentinho',
          'Barriga', 'Cacháça', 'Careca', 'Fofão', 'Xuxa', 'Ganso', 'Love', 'Ratão',
          'Furacão', 'Chorão', 'Animal', 'Cazuza', 'Playmobil', 'Shrek', "Bola de Fogo",
          'Zóio', 'Pit Bull', 'Show','Chinelinho', 'Pombo', 'Alemão', 'Loco' ]
apelido.uniq!

team1 = Team.find_or_create_by!(name: "Clube de Regatas Cristovão Colombo")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(21..25)
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
    team: team1
  )
end

team2 = Team.find_or_create_by!(name: "São Pedro Futebol Clube")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(11..15)
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
    team: team2
  )
end

team3 = Team.find_or_create_by!(name: "Esporte Clube Nacional")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(16..20)
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
    team: team3
  )
end

team4 = Team.find_or_create_by!(name: "Sociedade Esportiva Coqueiros")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(11..15)
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
    team: team4
  )
end

team5 = Team.find_or_create_by!(name: "Clube de Regatas do Flamingo")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(21..25)
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
    team: team5
  )
end

team6 = Team.find_or_create_by!(name: "Esporte Clube América")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(16..20)
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
    team: team6
  )
end

team7 = Team.find_or_create_by!(name: "Formiga Atlético Clube")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
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
    team: team7
  )
end

team7 = Team.find_or_create_by!(name: "Futebol Clube Santos Dumont")

positions = ["G"] * 3 + ["D"] * 6 + ["M"] * 6 + ["A"] * 5
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
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
    team: team7
  )
end

#Criar 16 jogadores para sem time, sendo 4 deles na posição de goleiro, 4 na posição de atacante, 4 na posição de meia e 4 na posição de defensor
positions = ["G"] * 3 + ["D"] * 5 + ["M"] * 5 + ["A"] * 4
positions.each do |position|
  name = "#{Faker::Name.male_first_name}"
  while Player.exists?(name: name)
    name = "#{Faker::Name.male_first_name} #{apelido.pop}"
  end
  level = rand(26..30)
  yellow_card = 0
  red_card = 0
  goal_scored = 0
  injury = false
  price = level * 8769

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