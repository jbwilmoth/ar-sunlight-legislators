require_relative '../app/models/legislator'

  puts Legislator.list_by_state
  puts
  puts Legislator.rep_count_percent("F")
  puts
  puts Legislator.senator_count_percent("M")
  puts
  puts Legislator.counted_states_order
  puts
  puts Legislator.list_members_by_state("TN")