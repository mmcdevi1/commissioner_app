class Standings
  attr_accessor :points, :team

  def initialize(team)
    @team   = team
    @points = {}
  end

  def add_points
    points[team] = 3
  end

  def team_exists?(t)
    team == t
  end
end