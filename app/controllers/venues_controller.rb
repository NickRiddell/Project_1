class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    Venue.create(venue_params)
    redirect_to( venues_path )
  end

  def show
    load_venue
  end

  def edit
    load_venue
  end

  def update
    load_venue
    venue.update(venue_params)
    redirect_to(venues_path)
  end

  def destroy
    load_venue
    venue.destroy
    redirect_to( venues_path )
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :description, :image, :location)
  end

  def load_venue
    @venue = Venue.find(params[:id])
  end
end
