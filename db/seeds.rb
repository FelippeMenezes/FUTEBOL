require 'faker'

8.times do |i|
  team_name = Faker::Sports::Football.team
  while Team.exists?(name: team_name)
    team_name = Faker::Sports::Football.team
  end
  team = Team.create!(name: team_name)
 
  22.times do
    name = Faker::Name.male_first_name
    while Player.exists?(name: name)
      name = Faker::Name.male_first_name
    end
    position = ["G", "D", "L", "M", "A"].sample
    agility = position == 'G' ? rand(80..99) : rand(31..79)
    strength = position == 'D' ? rand(80..99) : rand(31..79)
    speed = position == 'L' ? rand(80..99) : rand(31..79)
    balance = position == 'M' ? rand(80..99) : rand(31..79)
    accuracy = position == 'A' ? rand(80..99) : rand(31..79)

    case position
    when 'G'
      price =  agility* 71 + strength * 10 + speed * 10 + balance * 10 + accuracy * 10
    when 'D'
      price = strength * 71 + balance * 10 + agility * 10 + accuracy * 10 + speed * 10
    when 'L'
      price = speed * 71 + balance * 10 + agility * 10 + accuracy * 10 + strength * 10
    when 'M'
      price = balance * 71 + agility * 10 + accuracy * 10 + strength * 10 + speed * 10
    when 'A'
      price = accuracy * 71 + speed * 10 + agility * 10 + strength * 10 + balance * 10
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
 