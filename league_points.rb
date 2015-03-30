# A commissioner adds scores of a game. A game 
# consists of 2 teams and their respective score.
# The commissioner must input a string of the scores.
# Ex. 'Yankees 6 Mets 3'
# The app must calculate the winning team and award 
# the winning team 3 points for the overall standing.
# If there is a tie, each team is awarded a point.

# Commissioner
 # name
# Game
	# 2 teams
	# 2 scores
	# winner
# Team
	# name
# Score
# Standings
	# points
# Engine
	# run
require 'pry'
require './commissioner.rb'

class Engine
	attr_accessor :commissioner, :standings

	CHOICES = ['1', '2', 'e', 'exit']

	def initialize
		@commissioner = Commissioner.new
		@standings = {}
		run
	end

	def add_points_to_team(team, points)
		if standings.has_key?(team)
			standings[team] += points
		else
			standings[team] = points
		end
	end

	def analyze_game
		if commissioner.new_game.away_score > commissioner.new_game.home_score
			add_points_to_team(commissioner.new_game.away_team, 3)
			add_points_to_team(commissioner.new_game.home_team, 0)
		elsif commissioner.new_game.away_score < commissioner.new_game.home_score
			add_points_to_team(commissioner.new_game.away_team, 0)
			add_points_to_team(commissioner.new_game.home_team, 3)
		else
			add_points_to_team(commissioner.new_game.away_team, 1)
			add_points_to_team(commissioner.new_game.home_team, 1)
		end
		binding.pry
 	end

	def run
		puts "Welcome to the League"
		commissioner.input_name
		while true 
			commissioner.choose_options
			analyze_game
		end
	end
end

Engine.new

































