require 'spec_helper'

describe Round do
  before(:each) do
    player_1 = Player.new
    player_2 = Player.new
    @round = Round.new(player_1, player_2)
  end

  it "should be a round" do
    @round.should be_kind_of(Round)
  end

  describe "goal?" do
    it "should cache result" do
      @round.player_1_scored?([1,2], [1,3]).should be_true
      @round.player_1_scored?([1,2], [1,2]).should be_true #as we don't want to change it after shooting is done

      @round.player_2_scored?([1,2], [1,2]).should be_false
      @round.player_2_scored?([1,2], [1,22]).should be_false
    end

    it "should be true if there's a goal" do
      @round.player_1_scored?([1,2], [1,3]).should be_true
    end

    it "should be false if there's no goal" do
      @round.player_1_scored?([1,2], [1,2]).should be_false
    end
  end
end
