require 'state_machine'

class Game
  attr_accessor :state, :player_1, :player_2

  def initialize
    super #provided by state machine
  end

  state_machine :initial => :setting_up do
    event :next_round do
      transition :round_1 => :round_2, :round_2 => :round_3, :round_3 => :round_4, :round_4 => :round_5
    end

    event :start do
      transition :setting_up => :round_1, :if => lambda {|game| game.players_present? }
    end

    event :finish do
      transition :round_5 => :finished
    end
  end

  def players_present?
    @player_1 and @player_2
  end
end
