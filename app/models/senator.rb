require 'active_record'

class Senator < ActiveRecord::Base

  def self.add(input)
    Senator.create(input)
  end

end
