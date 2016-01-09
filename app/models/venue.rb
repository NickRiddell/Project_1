class Venue < ActiveRecord::Base
  has_many :shows
  has_many :performers, :through => :shows
end
