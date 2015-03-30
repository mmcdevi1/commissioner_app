require './team.rb'
require './score.rb'

class Game
  attr_accessor :home_team, :away_team, :away_score, :home_score

  def initialize
    @home_team  = Team.new
    @home_score = Score.new
    @away_team  = Team.new
    @away_score = Score.new
  end
end