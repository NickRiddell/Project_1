class BookingsController < ApplicationController
 
 load_and_authorize_resource
  def index
    if can? :manage, :all
    @bookings = Booking.all
    else
    @bookings = Booking.where(user_id: current_user.id)
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    Booking.create(booking_params.merge(user_id: current_user.id))
    redirect_to(bookings_path)
  end

  def show
    load_booking
  end

  def edit
    load_booking
  end

  def update
    load_booking
    @booking.update(booking_params)
    redirect_to(bookings_path)
  end

  def destroy
    load_booking
    @booking.destroy
    redirect_to(bookings_path)
  end

  private
  def booking_params
    params.permit(:show_id)
  end

  def load_booking
    @booking = Booking.find(params[:id])
  end
end
