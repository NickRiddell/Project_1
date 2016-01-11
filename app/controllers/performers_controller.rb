class PerformersController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:search]
      @performers = Performer.search(params[:search])
    else
      @performers = Performer.all
    end
  end

  def new
    @performer = Performer.new
    @show = Show.all
  end

  def create
    Performer.create(performer_params)
    redirect_to( performers_path )
  end

  def show
    load_performer
  end

  def edit
    load_performer
    @show = Show.all
  end

  def update
    load_performer
    performer.update(performer_params)
    redirect_to(performers_path)
  end

  def destroy
    load_performer
    @performer.destroy
    redirect_to( performers_path )
  end

  private
  def performer_params
    params.require(:performer).permit(:name, :description, :image)
  end

  def load_performer
    @performer = Performer.find(params[:id])
  end
end
