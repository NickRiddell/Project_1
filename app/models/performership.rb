class Performership < ActiveRecord::Base
  belongs_to :performer
  belongs_to :show
end
