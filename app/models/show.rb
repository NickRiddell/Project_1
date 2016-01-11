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

  def human_readable_start_date
     start_time.strftime('%A, %B %d %Y')
  end

   def human_readable_start_time
     start_time.strftime('%H:%M')
   end

   def human_readable_end_date
     end_time.strftime('%A, %B %d %Y')
   end

   def human_readable_end_time
     end_time.strftime('%H:%M')
   end

   def self.events_at_venue(v_id)
     where(venue_id:v_id)
   end

   def event_overlaps?(venue_id)
     Event.events_at_venue(venue_id).all? do |event|
       (event.event_date <= end_time) and (event_date >= event.end_time)  
     end
   end
end
