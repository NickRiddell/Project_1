class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :performer
  has_many :bookings
  has_many :users, :through => :bookings
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def self.search(query)
    where("name || description like ?", "%#{query}%")
  end
end
