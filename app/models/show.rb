class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :performer
  has_many :bookings
  has_many :users, :through => :bookings
  validates :name, uniqueness: true
end
