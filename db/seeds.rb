# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Club.create([{name: "FCLA", location: "westside"},{name: "LAUFA" ,location: "hollywood"},{name: "real so cal" ,location: "valley"},{name: "strikers" ,location: "irvine"},{name: "surf" ,location: "san diego"},{name: "valley united",location: "valley"}])
League.create([{name: "SCSDL"},{name: "Presidio"},{name: "Coast"}])
20.times do
  club = rand(5) + 1
  age =  8 + rand(10)
  Team.create([{name: "#{Club.find(club).name} #{age}", league_id: rand(3), club_id: club, age: age , coach: "Juan", rank: rand(100)}])
end
100.times do
  Player.create([{team_id: rand(20), name: "pablo", birthday: "#{rand(13)}/#{rand(28)}/#{rand(100)}" }])
end