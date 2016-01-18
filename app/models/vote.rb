class Vote < ActiveRecord::Base
  belongs_to :show
  validates :value, inclusion: { in: [1, -1] }
end
