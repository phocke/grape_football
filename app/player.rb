class Player

  # def initialize
  # end

  def save x = random_x, y = random_y
    [x, y]
  end


  def shoot x = random_x, y = random_y
    [x, y]
  end

  private

  def random_x
    (0..4).to_a.sample
  end

  def random_y
    (0..2).to_a.sample
  end

end
