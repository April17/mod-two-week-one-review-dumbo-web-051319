require "pry"
class SeasController < ApplicationController
  #define your controller actions here


  def index
    @seas = Sea.all
  end

  def show
    @sea = Sea.find_by(id: params[:id])
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    # ActionController::Parameters.permit_all_parameters = true
    # binding.pry
    sea = Sea.find(params[:id])
    pram = params[:sea].to_hash
    sea.update(pram)
    redirect_to "/seas/#{params[:id]}"
  end

  def new
    @sea = Sea.new
  end

  def create
    # binding.pry
    sea = Sea.create(sea_params)
    redirect_to "/seas/#{sea.id}"
  end

  def destroy
    # binding.pry
    sea = Sea.find_by(id: params[:id])
    sea.destroy
    redirect_to "/seas"
  end







  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
