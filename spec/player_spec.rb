require 'spec_helper'

describe Player do
  before(:each) do
    @player = Player.new
  end

  it "should be a player" do
    @player.should be_kind_of(Player)
  end

  describe "save" do
    it "should be an array of two positive integers" do
      @player.save.should be_kind_of(Array)
      @player.save.size.should == 2
    end
  end

  describe "shoot" do
    it "should be an array of two positive integers" do
      @player.shoot.should be_kind_of(Array)
      @player.shoot.size.should == 2
    end
  end
end
