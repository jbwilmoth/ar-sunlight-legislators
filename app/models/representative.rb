require 'active_record'

class Representative < ActiveRecord::Base

  def self.add(input)
    Representative.create(input)
  end

end
