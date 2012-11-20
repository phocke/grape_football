require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it "should be a game" do
    @game.should be_kind_of(Game)
  end

  describe "goal?" do
    it "should be true if there's a goal" do

    end

    it "should be false if there's no goal" do

    end
  end
end
