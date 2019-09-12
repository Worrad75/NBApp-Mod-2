puts "destroying all..."
User.destroy_all
Team.destroy_all
Player.destroy_all
Game.destroy_all
Statline.destroy_all
Follow.destroy_all


puts "making users"
User.create!(username: "Ryan", password: "1234567")
User.create!(username: "Darrow", password: "7654321")
User.create!(username: "Jason", password: "123456393")
User.create!(username: "Dan", password: "1234567")
User.create!(username: "Belinda", password: "1234567")


#--------------------------------------------------



puts "fetching team data"
team_string = RestClient.get('https://balldontlie.io/api/v1/teams')
team_hash = JSON.parse(team_string)

puts "creating teams"
team_hash["data"].each do |hash|
    Team.create!(
        full_name: hash["full_name"],
        city: hash["city"],
        conference: hash["conference"],
        division: hash["division"],
        abv: hash["abbreviation"]
    )
end

# byebug

#-----------------------------------------------------


player_url = "https://api-nba-v1.p.rapidapi.com/players/league/standard"
player_headers = {
    "X-RapidAPI-Host" => "api-nba-v1.p.rapidapi.com",
    "X-RapidAPI-Key" => "3f8f2409afmsh93b66a8d1ea041ep1dccbajsn504c1ffdf501"
  }
new_player_string = RestClient.get(player_url, player_headers)
new_player_hash = JSON.parse(new_player_string)



nba_players = new_player_hash["api"]["players"].select { |player| player["teamId"] != nil }

real_id_hash = {
    '1':1,
    '2':2,
    '4':3,
    '5':4,
    '6':5,
    '7':6,
    '8':7,
    '9':8,
    '10':9,
    '11':10,
    '14':11,
    '15':12,
    '16':13,
    '17':14,
    '19':15,
    '20':16,
    '21':17,
    '22':18,
    '23':19,
    '24':20,
    '25':21,
    '26':22,
    '27':23,
    '28':24,
    '29':25,
    '30':26,
    '31':27,
    '38':28,
    '40':29,
    '41':30
}




# non_nba_team_ids = [3, 12, 13, 18, 32, 33, 34, 35, 36, 37, 39, 42, 43, 44, 83]
nba_team_ids = [1,2,4,5,6,7,8,9,10,11,14,15,16,17,19,20,21,22,23,24,25,26,27,28,29,30,31,38,40,41]

puts "creating players"

nba_players.each do |hash|
    if nba_team_ids.include?(hash["teamId"].to_i)
        # byebug
        Player.create!(
            f_name: hash["firstName"],
            l_name: hash["lastName"],
            height: hash["heightInMeters"],
            weight: hash["weightInKilograms"],
            collegeName: hash["collegeName"],
            country: hash["country"],
            team_id: real_id_hash[hash["teamId"].to_sym]
        )
    end
end


#-----------------------------------------------------

puts "finding NEW GAMES"
# game_url = "https://api-nba-v1.p.rapidapi.com/games/seasonYear/2018"
game_url = "https://api-nba-v1.p.rapidapi.com/games/league/standard/2018"
game_headers = {
    "X-RapidAPI-Host": "api-nba-v1.p.rapidapi.com",
    "X-RapidAPI-Key": "3f8f2409afmsh93b66a8d1ea041ep1dccbajsn504c1ffdf501"
}
new_game_string = RestClient.get(game_url, game_headers)
new_game_hash = JSON.parse(new_game_string)



puts "creating games"
new_game_hash["api"]["games"].each do |hash|

    

    if nba_team_ids.include?(hash["vTeam"]["teamId"].to_i) &&
        nba_team_ids.include?(hash["hTeam"]["teamId"].to_i) &&
        (hash["seasonStage"].to_i > 1)

        puts hash["gameId"]
        
        
        game = Game.new(
            date: hash["startTimeUTC"],
            home_id: hash["hTeam"]["teamId"].to_i,
            home_score: hash["hTeam"]["score"]["points"].to_i,
            away_id: hash["vTeam"]["teamId"].to_i,
            away_score: hash["vTeam"]["score"]["points"].to_i,
            postseason: false,
            season_year: hash["seasonYear"].to_i,
            api_id: hash["gameId"].to_i,
            season_stage: hash["seasonStage"].to_i,
            arena: hash["arena"]
        )

        if !Game.all.include?(game)
            game.save
        end
    end
    # byebug
end

##-----------------------------------------------------





#-----------------------------------------------------

# puts "fetching stat data"
# stat_string = RestClient.get("https://balldontlie.io/api/v1/stats")
# stat_hash = JSON.parse(stat_string)


# puts "creating statlines"
# stat_hash["data"].each do |hash|
#     byebug
#     Statline.create!(
#         player_id: hash["player"]["id"],
#         game_id: Game.all.find_by(api_id: hash["game"]["id"]).id,
#         pts: hash["pts"],
#         ast: hash["ast"],
#         reb: hash["reb"],
#         stl: hash["stl"],
#         blk: hash["blk"],
#         turnover: hash["turnover"],
#         pf: hash["pf"],
#         min: hash["min"],
#         dreb: hash["dreb"],
#         oreb: hash["oreb"],
#         fg_pct: hash["fg_pct"],
#         fga: hash["fga"],
#         fgm: hash["fgm"],
#         fg3_pct: hash["fg3_pct"],
#         fg3a: hash["fg3a"],
#         fg3m: hash["fg3m"],
#         ft_pct: hash["ft_pct"],
#         fta: hash["fta"],
#         ftm: hash["ftm"]
#     )
# end


#-----------------------------------------------------

puts "creating follows"
Follow.create!(player_id: 1, user_id: 1, favorite: true)
Follow.create!(player_id: 2, user_id: 2)
Follow.create!(player_id: 3, user_id: 3, favorite: true)
Follow.create!(player_id: 5, user_id: 4)
Follow.create!(player_id: 5, user_id: 5)
Follow.create!(player_id: 10, user_id: 1, favorite: true)
Follow.create!(player_id: 15, user_id: 2)
Follow.create!(player_id: 20, user_id: 3)
Follow.create!(player_id: 3, user_id: 4, favorite: true)
Follow.create!(player_id: 17, user_id: 5)

puts "Finished!"