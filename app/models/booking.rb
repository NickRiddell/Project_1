class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  has_one :vote, dependent: :destroy
end
