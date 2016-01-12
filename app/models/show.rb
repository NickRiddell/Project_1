class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :performer
  has_many :bookings, dependent: :destroy
  has_many :users, :through => :bookings
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
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

   def tickets_sold
     s = self.bookings.all.map {|b| b.ticket }
     s.inject{|sum,x| sum + x }
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

   def available_timeslot?(venue_id)
     Show.venue_schedule(venue_id).all? do |show|
       (show.start_time overlaps? end_time) and (start_time overlaps? show.end_time) 
     end
   end
end
