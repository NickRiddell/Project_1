class ShowsController < ApplicationController
  load_and_authorize_resource

  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
    @venue = Venue.all
  end

  def create
    Show.create(show_params)
    @venue = Venue.find(params["show"] ["venue_id"].to_i)
    @venue.shows << @show
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
    @venue.shows << @show
    @show.update(show_params)
    redirect_to(shows_path)
  end  

  def destroy
    load_show
    show.destroy
    redirect_to( shows_path )
  end

  private
  def show_params
    params.require(:show).permit(:name, :image, :description, :venue_id, :performer_id)
  end

  def load_show
    @show = Show.find(params[:id])
  end
end
