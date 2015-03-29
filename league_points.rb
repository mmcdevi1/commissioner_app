require './team.rb'

class LeaguePointCalc
	attr_accessor :leaderboard, :team_1, :team_2

	def initialize
		@leaderboard = {}
		@team_1 = Team.new
		@team_2 = Team.new
		run
	end

	def run
		divider
		puts "Welcome to the League"

		while true
			divider
			puts "Press '1' to add team scores"
			puts "Press '2' to print leaderboard"
			puts "Press 'e' or 'exit' to exit"
			divider
			print "Enter your choice: "
			response = gets.chomp.downcase
			case response
			when 'e'
				break
			when 'exit'
				break
			when '1'
				score_array = []
				divider
				print "Enter the score of the game with team names: "
				game_score = gets.chomp.downcase

				game_score.split(' ').each do |item|
					score_array << item
				end

				team_1.name = score_array[0]
				team_2.name = score_array[2]
				team_1_score = score_array[1].to_i
				team_2_score = score_array[3].to_i

				if team_1_score > team_2_score
					if leaderboard.has_key?(team_1.name)
						leaderboard[team_1.name] += 3
					else
						leaderboard[team_1.name] = 3
					end
					if leaderboard.has_key?(team_2.name)
						leaderboard[team_2.name] += 0
					else
						leaderboard[team_2.name] = 0
					end
					# team_1.points += 3
					# team_2.points += 0
				elsif team_2_score < team_1_score
					if leaderboard.has_key?(team_2.name)
						leaderboard[team_2.name] += 3
					else
						leaderboard[team_2.name] = 3
					end
					if leaderboard.has_key?(team_1.name)
						leaderboard[team_1.name] += 0
					else
						leaderboard[team_1.name] = 0
					end
				else
					if leaderboard.has_key?(team_1.name)
						leaderboard[team_1.name] += 1
					else
						leaderboard[team_1.name] = 1
					end
					if leaderboard.has_key?(team_2.name)
						leaderboard[team_2.name] += 1
					else
						leaderboard[team_2.name] = 1
					end
				end

			when '2'
				puts leaderboard
			end
		end
	end

	def divider
		puts "=" * 70
	end
end

LeaguePointCalc.new