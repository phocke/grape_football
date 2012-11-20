require 'spec_helper'

def boolean?(val)
  !!val == val
end

describe Round do
  before(:each) do
    @round = Round.new
  end

  it "should be a round" do
    @round.should be_kind_of(Round)
  end

  describe "goal?" do
    it "should be true if there's a goal" do
      @round.shoot_coordinates = [0,0]
      @round.save_coordinates = [0,3]
      @round.goal?.should be_true

      @round.shoot_coordinates = [1,4]
      @round.save_coordinates = [1,1]
      @round.goal?.should be_true

      @round.shoot_coordinates = [-1,-4]
      @round.save_coordinates = [1,1]
      @round.goal?.should be_true
    end

    it "should be false if there's no goal" do
      @round.shoot_coordinates = [0,0]
      @round.save_coordinates = [0,0]
      @round.goal?.should be_false

      @round.shoot_coordinates = [1,4]
      @round.save_coordinates = [1,4]
      @round.goal?.should be_false

      @round.shoot_coordinates = [1,-4]
      @round.save_coordinates = [1,-4]
      @round.goal?.should be_false
    end
  end
end
