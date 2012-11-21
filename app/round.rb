#This class just checks x and y coordinates - we don't care about being out of bounds here etc.
class Round
  attr_accessor :player_1, :player_2, :player_1_score, :player_2_score
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def player_1_score(shoot_coordinates=@player_1.shoot, save_coordinates=@player_2.save)
    if @player_1_score.nil?
      @player_1_score = (save_coordinates != shoot_coordinates ? 1 : 0)
    else
      @player_1_score
    end
  end

  def player_2_score(shoot_coordinates=@player_2.shoot, save_coordinates=@player_1.save)
    if @player_2_score.nil?
      @player_2_score = (save_coordinates != shoot_coordinates ? 1 : 0)
    else
      @player_2_score
    end
  end
end
