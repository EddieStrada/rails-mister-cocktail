class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params) # strong params!
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      # redirect_to new_restaurant_path
      render :new # new.html.erb
    end
  end

  private

  def cocktail_params
    # params[:task] -> permit name, address, raint
    params.require(:cocktail).permit(:name, :photo)
  end
end
