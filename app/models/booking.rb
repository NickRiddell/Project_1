class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  validates :ticket, presence: true
end
