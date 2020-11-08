class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :destroy] 

  def index
    @cocktails = Cocktail.all.order(name: :asc)
  end
  
  def show
    
  end
  
  def new
    @cocktail = Cocktail.new
  end
  
  def create
    @cocktail = Cocktail.new(cocktails_params)
  
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: "Cocktail <strong>#{@cocktail.name}</strong> was created successfully."
    else
      render :new
      end
  end

  def destroy
    
    @cocktail.destroy
    redirect_to root_path
  end
  
  private
  
  def cocktails_params
    params.require(:cocktail).permit(:name, :photo)
  end
end

def set_cocktail
  @cocktail = Cocktail.find(params[:id])
end