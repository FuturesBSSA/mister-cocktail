class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.valid?
      @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy!
    redirect_to cocktail_path
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
