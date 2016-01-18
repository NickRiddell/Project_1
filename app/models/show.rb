class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :performer
  has_many :bookings, dependent: :destroy
  has_many :users, :through => :bookings
  has_many :votes, :through => :bookings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates_presence_of :start_time, :end_time


  def self.search(query)
    where("name || description || start_time || end_time like ?", "%#{query}%")
  end

  def human_readable_start_date
   start_time.strftime('%A, %B %-d %Y')
  end

  def human_readable_start_time
   start_time.strftime('%H:%M')
  end

  def human_readable_end_date
   end_time.strftime('%A, %B %-d %Y')
  end

  def human_readable_end_time
   end_time.strftime('%H:%M')
  end

  def rating
    votes.sum(:value)
  end

 def tickets_sold
   s = self.bookings.all.map {|b| b.ticket }
   s.inject(0) {|sum,x| sum + x }
 end

 def available_spaces
   self.capacity - tickets_sold 
 end

 def full?
   available_spaces <= 0
 end

 def self.venue_schedule(v_id)
   where(venue_id:v_id)
 end

 def self.overlaps?(venue_id, new_show)
  Show.venue_schedule(venue_id).any? do |show|
    (new_show.start_time - show.end_time) * (show.start_time - new_show.end_time) >= 0
  end
  end
end



