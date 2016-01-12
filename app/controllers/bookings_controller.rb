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
    @show = Show.find(params[:show_id])
    @bookings = Booking.new
  end

  def create
      @booking = current_user.bookings.create(booking_params)
      redirect_to (bookings_path)
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
    params.require(:booking).permit(:show_id, :ticket)
  end

  def load_booking
    @booking = Booking.find(params[:id])
  end
end
