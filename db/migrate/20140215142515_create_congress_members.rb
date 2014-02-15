require_relative 'config'

class CreateCongressMembers < ActiveRecord::Migration
  def change
    create_table :congress_members do |t|
      t.string  :title
      t.string  :firstname
      t.string  :middlename
      t.string  :lastname
      t.string  :name_suffix
      t.string  :nickname
      t.string  :party
      t.string  :state
      t.integer :district
      t.integer :in_office
      t.string  :gender
      t.string  :phone
      t.fax     :fax
      t.string  :website
      t.string  :webform
      t.string  :congress_office
      t.string  :bioguide_id
      t.string  :votesmart_id
      t.string  :fec_id
      t.string  :govtrack_id
      t.string  :crp_id
      t.string  :twitter_id
      t.string  :congresspedia_url
      t.string  :youtube_url
      t.string  :facebook_id
      t.string  :official_rss
      t.string  :senate_class
      t.string  :birthdate
  end
end
