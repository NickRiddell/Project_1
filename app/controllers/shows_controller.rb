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
      @new_show = Show.new(show_params)
      @venue = @new_show.venue
        if Show.overlaps?(@new_show.venue_id, @new_show)
          flash[:alert] = "The venue is already booked for this time slot!"
        else
          @new_show.save
          concatenate_show
        end
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
    @venue = Venue.find(params["show"]["venue_id"].to_i)
    concatenate_show
    update_but_for_time
      if Show.overlaps?(@show.venue_id, @show)
        @show.update(show_params)
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

  def update_but_for_time
    @show.update(name: show_params[:name])
    @show.update(image: show_params[:image])
    @show.update(description: show_params[:description])
    @show.update(venue_id: show_params[:venue_id])
    @show.update(performer_id: show_params[:performer_id])
    @show.update(capacity: show_params[:capacity])
  end
end
