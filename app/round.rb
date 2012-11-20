#This class just checks x and y coordinates - we don't care about being out of bounds here etc.
class Round
  attr_accessor :shoot_coordinates, :save_coordinates
  def initialize(shoot_coordinates=[], save_coordinates=[])
    @shoot_coordinates = shoot_coordinates
    @save_coordinates = save_coordinates
  end

  def goal?
    @save_coordinates != @shoot_coordinates
  end
end
