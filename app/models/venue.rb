class Venue < ActiveRecord::Base
  has_many :shows
  has_many :performers, :through => :shows
  validates :name, presence: true, uniqueness: true

  def self.search(query)
    where("name || description || location like ?", "%#{query}%")
  end
end
