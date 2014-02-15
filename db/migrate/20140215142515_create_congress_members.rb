require_relative 'config'

class CreateCongressMembers < ActiveRecord::Migration
  def change
    create_table :congress_members do |t|
      t.string  :title
      t.string  :firstname
      t.string  :lastname
      t.string  :party
      t.string  :state
      t.integer :in_office
      t.string  :gender
      t.string  :phone
      t.string  :website
      t.string  :congress_office
      t.string  :twitter_id
      t.string  :youtube_url
      t.string  :facebook_id
      t.string  :official_rss
      t.string  :senate_class
      t.string  :birthdate
  end
end
