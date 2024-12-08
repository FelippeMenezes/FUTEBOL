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
    position = ["G", "D", "M", "A"].sample
    level = rand(6..30) 
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
 