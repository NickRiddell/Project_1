class ShowsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:search]
      @shows = Show.search(params[:search]).order("name ASC")
    else
      @shows = Show.all
    end
  end

  def new
    @show = Show.new
    @venue = Venue.all
  end

  def create
    show = Show.new(show_params)
        if show.available_timeslot?(show.venue_id)
          show.save
        else
          flash[:alert] = "The venue is already booked for this time slot!"
        end
    @venue = Venue.find(params["show"] ["venue_id"].to_i)
    concatenate_show
    redirect_to(shows_path)
  end

  def show
    load_show
  end

  def edit
    load_show
    @venue = Venue.all
  end

  def update
    load_show
    @venue = Venue.find(params["show"] ["venue_id"].to_i)
    concatenate_show
      if @show.available_timeslot?(@show.venue_id)
        @show.update
      else
        flash[:alert] = "The venue is already booked for this time slot!"
      end
    redirect_to(shows_path)
  end  

  def destroy
    load_show
    @show.destroy
    redirect_to( shows_path )
  end

  private
  def show_params
    params.require(:show).permit(:name, :image, :description, :venue_id, :performer_id, :start_time, :end_time, :capacity)
  end

  def load_show
    @show = Show.find(params[:id])
  end

  def concatenate_show
    @venue.shows << @show
  end
end
