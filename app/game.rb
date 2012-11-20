require 'state_machine'
class Game
  attr_accessor :state


  state_machine :initial => :setting_up do

  end

  def transitions
    [{:setting_up => :round_1, :on => :start}]
  end

  # Create a state machine for this vehicle instance dynamically based on the transitions defined from the source above
  def machine
    game = self
    @machine ||= Machine.new(game, :initial => :parked) do
      game.transitions.each {|attrs| transition(attrs)}

      # Persist the state on the vehicle itself
      after_transition do
        game.state = vehicle.machine.state
        game.save
      end
    end
  end

  def save
    # Save the state change...
  end
end


class Machine
  def self.new(object, *args, &block)
    machine = Class.new do
      def definition
        self.class.state_machine
      end
    end
    machine.state_machine(*args, &block)
    machine.new
  end
end
