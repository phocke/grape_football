require 'state_machine'

class Game
  attr_accessor :state, :player_1, :player_2, :record

  def initialize
    @record={}
    super #provided by state machine
  end

  state_machine :initial => :setting_up do
    event :next_round do
      transition :round_1 => :round_2, :round_2 => :round_3, :round_3 => :round_4, :round_4 => :round_5
    end
    after_transition :on => :next_round, :do => :play_round

    event :start do
      transition :setting_up => :round_1, :if => lambda {|game| game.players_present? }
    end

    after_transition :on => :start, :do => :name_players
    after_transition :on => :start, :do => :play_round

    event :finish do
      transition :round_5 => :finished
    end

  end

  def play_round(player_1_shoot=@player_1.shoot,
                 player_2_save=@player_2.save,
                 player_2_shoot=@player_1.shoot,
                 player_1_save=@player_2.save)

    round = Round.new(@player_1, @player_2)
    @record[state] = [round.player_1_score(player_1_shoot, player_2_save),
                      round.player_2_score(player_2_shoot, player_1_save)]

  end

  def result
    scores = @record.collect{|k,v| v  }
    scores = scores.inject([0,0]){|initial, round_score| initial[0] += round_score[0]
                                                initial[1] += round_score[1]
                                                initial }
    return "draw" if scores[0] == scores[1]
    return "#{@player_1.name} won" if scores[0] > scores[1]
    return "#{@player_2.name} won" if scores[0] < scores[1]
  end

  def name_players
    @player_1.name = "player_1"
    @player_2.name = "player_2"
  end

  def players_present?
    @player_1 and @player_2
  end
end
