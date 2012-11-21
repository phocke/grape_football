#This class just checks x and y coordinates - we don't care about being out of bounds here etc.
class Round
  attr_accessor :player_1, :player_2, :player_1_scored, :player_2_scored
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def player_1_scored?(shoot_coordinates=@player_1.shoot, save_coordinates=@player_2.save)
    @player_1_scored.nil? ? @player_1_scored = (save_coordinates != shoot_coordinates) : @player_1_scored
  end

  def player_2_scored?(shoot_coordinates=@player_2.shoot, save_coordinates=@player_1.save)
    @player_2_scored.nil? ? @player_2_scored = (save_coordinates != shoot_coordinates) : @player_2_scored
  end
end
