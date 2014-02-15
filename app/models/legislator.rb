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

end

puts Legislator.list_by_state("TN")

puts Legislator.list_by_gender("F")

puts Legislator.list_active

puts Legislator.total
