require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.list_by_state(state)
    sorted_states = counted_states_order
    list_states = ""
    sorted_states.each do |state_count|
      list_states << list_by_state(state_count)
    end
    list_states.strip
  end

  def list_by_state
    senators_by_state = Legislator.where("state = ? AND title = ?", state_count[0], 'Sen')
    reps_by_state     = Legislator.where("state = ? AND title = ?", state_count[0], 'Rep')
    if senators_by_state.count > 0 ||
  end

  def self.list_by_gender(gender)

  end

  def self.list_active

  end

  def self.total

  end

  def self.counted_states_order
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
