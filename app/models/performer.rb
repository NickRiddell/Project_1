class Performer < ActiveRecord::Base
  has_many :shows
  has_many :venues, :through => :shows
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def self.search(query)
    where("name || description like ?", "%#{query}%")
  end
end
