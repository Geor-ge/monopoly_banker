class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def buy_property
    @property = Property.find(params[:id])
  end

  def build_house
    @property = Property.find(params[:id])
    if @property.number_of_houses < 4 && @property.number_of_hotels == 0
      @property.number_of_houses += 1
      @property.save
      redirect_to '/properties'
    end
  end

  def build_hotel
    @property = Property.find(params[:id])
    if @property.number_of_houses == 4
      @property.number_of_houses = 0
      @property.number_of_hotels = 1
      @property.save
      redirect_to '/properties'
    end
  end

  def update
    @property = Property.find(params[:id])
  end

 private

  def property_params
    params.require(:property).permit(:player_id, :owned, :number_of_houses, :number_of_hotels)
  end

end
