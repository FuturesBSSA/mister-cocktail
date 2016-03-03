class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create!(cocktail_param)
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def update
    @cocktail.update!(cocktail_param)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy!
    redirect_to cocktail_path(@cocktail)
  end


  private

  def cocktail_param
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
