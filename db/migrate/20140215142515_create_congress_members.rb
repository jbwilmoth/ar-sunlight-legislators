require_relative '../../db/config'

class CreateCongressMembers < ActiveRecord::Migration
  def change
    create_table :congress_members do |member|
      member.integer :id
      member.string  :title
      member.string  :firstname
      member.string  :middlename
      member.string  :lastname
      member.string  :name_suffix
      member.string  :party
      member.string  :state
      member.string  :in_office
      member.string  :gender
      member.string  :phone
      member.string  :fax
      member.string  :website
      member.string  :webform
      member.string  :twitter_id
      member.string  :birthdate
    end
  end
end
