require 'active_record'

class Congress < ActiveRecord::Base

  def self.add(input)
    Congress.create(input)
  end

end
