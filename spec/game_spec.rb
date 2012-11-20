require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it "should be a started game" do
    @game.should be_kind_of(Game)
    @game.state.should == "setting_up"
  end

  describe "goal?" do

  end
end
