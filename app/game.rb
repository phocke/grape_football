  require 'state_machine'
  require 'active_support/core_ext'
  class Game
    attr_accessor :state, :machine

    def initialize
      @state = 'setting_up'
      machine
    end
    delegate :start, :finish, :next_round, :to => :@machine



    def transitions
      transitions_array = [{:setting_up => :round_1, :on => :start}, {:round_5 => :finished, :on => :finish}]
      round_transitions = {}
      4.times do |n|
        from, to  = "round_#{n+1}".to_sym, "round_#{n+2}".to_sym
        round_transitions[from] = to
      end
      round_transitions[:on] = :next_round
      transitions_array << round_transitions

      return transitions_array
    end

    # Create a state machine for this vehicle instance dynamically based on the transitions defined from the source above
    def machine
      game = self
      @machine ||= Machine.new(game, :initial => :setting_up) do
        game.transitions.each {|attrs| transition(attrs)}

        # Persist the state on the vehicle itself
        after_transition do
          game.state = game.machine.state
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
