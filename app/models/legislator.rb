require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def name
    names_combined = "#{self.title} #{self.firstname}"
    names_combined << " #{middlename}" unless middlename == ""
    names_combined << " #{lastname}"
    names_combined << ", #{name_suffix}" unless name_suffix == ""
    names_combined
  end

  def self.list_by_state
    sorted_states = counted_states_order
    list_of_states = ""
    sorted_states.each do |state_count|
      list_of_states << list_per_state(state_count)
    end
    list_of_states.strip
  end

  def self.list_per_state(state_count)
    senators_per_state = Legislator.where("state = ? AND title = ?", state_count[0], 'Sen')
    reps_per_state     = Legislator.where("state = ? AND title = ?", state_count[0], 'Rep')
    if senators_per_state.count > 0 || reps_per_state.count > 0
      "\n#{state_count[0]}: #{senators_per_state.count} Senators, #{reps_per_state.count} Representatives"
    else
      ""
    end
  end

  def self.gender_count_and_percent(gender)
    "#{senator_count_percent(gender)}\n#{rep_count_percent(gender)}"
  end

  def self.counted_states_order
    total_result = Legislator.all
    counted_states = Hash.new(0)
    total_result.each do |legislator|
      counted_states[legislator.state] += 1
    end
    counted_states.collect { |state, count| [state, count] }.sort { |a, b| b[1] <=> a[1] }
  end

  def self.senator_count_percent(gender)
    senator_string = "#{gender_long(gender)} Senators: "
    senators = Legislator.where("title = ? AND in_office = ? AND gender = ?", "Sen", "1", gender)
    senator_string << "#{senators.count} (#{senators.count}%)"
  end

  def self.rep_count_percent(gender)
    rep_string = "#{gender_long(gender)} Representatives: "
    reps = Legislator.where("title = ? AND in_office = ? AND gender = ?", "Rep", "1", gender)
    rep_string << "#{reps.count} (#{((reps.count / 435.0)*100).to_i}%)"
  end

  def self.gender_long(gender)
    gender == "M" ? "Male" : "Female"
  end

  def self.list_members_by_state(state)
    "#{add_senators(state)}#{add_reps(state)}"
  end

  def self.add_senators(state)
    list_of_senators = "Senators:"
    senators = Legislator.where("state = ? AND title = ? AND in_office = ?", state, 'Sen', "1")    
    senators.each do |senator|
      list_of_senators << "\n  #{senator.name} (#{senator.party})"
    end
    list_of_senators
  end

  def self.add_reps(state)
    list_of_reps = "\nRepresentatives:"
    reps = Legislator.where("state = ? AND title = ?", state, 'Rep')
    reps.each do |rep|
      list_of_reps << "\n  #{rep.name} (#{rep.party})"
    end
    list_of_reps
  end
end

  puts Legislator.list_by_state
  puts
  puts Legislator.rep_count_percent("F")
  puts
  puts Legislator.senator_count_percent("M")
  puts
  puts Legislator.counted_states_order
  puts
  puts Legislator.list_members_by_state("TN")
