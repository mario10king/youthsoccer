# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'
League.create([{name: "SCSDL"},{name: "Presidio"},{name: "Coast"}])
a = 11
while a <= 17 
  squad = []
  age = a
  gender = {boys: "SB", girls: "SG"} 
  bracket = {pr: "0P", g: "1G", gn: "1N", gs: "1S", ses: "S1", sen: "S2", sew: "S3", see: "S4", 
  sa: "SA", sc: "SC", sd: "SD", se: "SE", sn: "SN", ss: "SS", sw: "SW",
  za: "ZA", zb: "ZB", zc: "ZC", zd: "ZD", ze: "ZE", zg: "ZG", zk: "ZK", zn: "ZN",
  zo: "ZO", zs: "ZS", zw: "ZW", zz: "ZZ"}
  bracket.each do |key, val|
    page = Nokogiri::HTML(open("http://www.coastsoccer.com/2014/#{gender[:boys]}#{age}#{val}.htm"))
    teams = page.css("table.StandTable td.StandTeam")
    list = []
    teams.each do |team|
      list << team.text.gsub(/\302\240/,"").strip
    end
    stats = page.css("table.StandTable td.StandCell")
    i = 0
    x = 0
    games = 0
    gp = []
    while i < list.length * 6
      games  += stats[i].text.gsub(/\302\240/,"").strip.to_i
      x+=1
      if x % 3 == 0
        ppg = (stats[i+1].text.gsub(/\302\240/,"").strip.to_i / games.to_f).round(2)
        if val == "1G" || val == "1N" || val == "1S" 
          gp << ppg - 1
        elsif val == "S1" || val == "S2" || val == "S3" || val == "S4"  
          gp << ppg - 2
        elsif val[0] == "S"  
          gp << ppg - 3
        elsif val[0] == "Z" 
          gp << ppg - 4
        else 
          gp << ppg
        end
        i += 4 
        games = 0
      else
        i+=1
      end
    end
  arr = list.zip(gp)
  arr.each do |team|
    squad << team
  end
  end
  squad.each do |team|
    if team[1].nan?
      squad.delete(team)
    else
      Team.create([{name: team[0], league_id: 3, age: age , ppg: team[1] }])
    end 
  end
  a += 1
end
