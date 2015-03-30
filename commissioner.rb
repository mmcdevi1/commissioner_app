require './game.rb'
require './standings.rb'

class Commissioner
  attr_accessor :name, :input, :new_game

  def initialize
    @name     = name
    @input    = input
    # @new_game = Game.new
  end

  def input_name
    print "Enter your name: "
    self.name = gets.chomp
    puts "Welcome #{self.name}"
  end

  def choose_options
    begin
      puts "Choose an option: "
      divider
      puts "Press '1' to add team scores"
      puts "Press '2' to print leaderboard"
      puts "Press 'e' or 'exit' to exit"
      divider
      print "Enter your choice: "
      self.input = gets.chomp.downcase
    end until Engine::CHOICES.include?(self.input)
    options(self.input)
  end

  def options(input)
    case input
    when 'e'
      false
    when 'exit'
      false
    when '1'
      self.new_game = Game.new
      score_array = []
      print "Enter the score of the game with team names: "
      game_score = gets.chomp.downcase

      game_score.split(' ').each do |item|
        score_array << item
      end

      self.new_game.away_team  = score_array[0]
      self.new_game.away_score = score_array[1].to_i
      self.new_game.home_team  = score_array[2]
      self.new_game.home_score = score_array[3].to_i
    when '2'
      # puts standings
    end
  end

  def to_s
    "#{}"
  end

  def divider
    puts "=" * 70
  end
end