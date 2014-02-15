require_relative '../db/config'
require_relative '../app/models/legislator'

puts Legislator.list_by_state("TN")

puts Legislator.list_by_gender("F")

puts Legislator.list_active

puts Legislator.total

# active record method calls go here.
