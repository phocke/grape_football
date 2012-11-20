require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it "should be a started game" do
    @game.should be_kind_of(Game)
  end

  describe "states" do
    it "should intialize in setting_up state" do
      @game.state.should == "setting_up"
    end

    it "should go to first round when started" do
      @game.machine.start
      @game.state.should == "round_1"
    end

    it "should have 5 rounds" do
      @game.start
      @game.state.should == "round_1"

      4.times do |n|
        @game.next_round
        @game.state.should == "round_#{n+2}"
      end
    end

    it "should finish after 5 rounds" do
      @game.start

      4.times do |n|
        @game.next_round
      end
      @game.state.should == "round_5"

      @game.next_round.should be_false #as we didn't move ahead

      @game.finish
      @game.state.should == "finished"
    end
  end
end
