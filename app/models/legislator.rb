require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.list_by_state(state)

  end

  def self.list_by_gender(gender)

  end

  def self.list_active

  end

  def self.total

  end

  def counted_states_order
    total_result = Legislator.all
    counted_states = Hash.new(0)
    total_result.each do |legislator|
      counted_states[legislator.state] += 1
    end
    counted_states.collect { |state, count| [state, count] }.sort { |a, b| b[1] <=> a[1] }
  end

end

puts Legislator.list_by_state("TN")
puts
puts Legislator.list_by_gender("M")
puts
puts Legislator.list_active
puts
puts Legislator.total
