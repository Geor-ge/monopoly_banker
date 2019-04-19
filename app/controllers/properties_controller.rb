class PropertiesController < ApplicationController

  include PropertiesHelper

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def buy_property
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    player = Player.find(params[:property][:player_id])
    if player.cash >= @property.property_price
      player.cash -= @property.property_price
      if @property.color == 'Railroad'
        player.number_of_railroads += 1
      elsif @property.color == 'Utility'
        player.number_of_utilities += 1
      end
      player.save
      @property.owned = true
      @property.player_id = player.id
      @property.save
    else
      flash[:warning] = "Not Enough Cash Stranger!"
    end
    redirect_to '/properties'
  end

  def sell_property
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    if property.number_of_hotels == 0 && property.number_of_houses == 0
      if property.mortgage == false
        if property.color == 'Railroad'
          owner.number_of_railroads -= 1
        elsif property.color == 'Utility'
          owner.number_of_utilities -= 1
        end
        owner.cash += property.mortgage_value
        owner.save
        property.owned = false
        property.player = nil
        property.save
      end
    end

    redirect_to '/properties'
  end

  def mortgage
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    if property.mortgage == false && property.number_of_hotels == 0 && property.number_of_houses == 0
      owner.cash += property.mortgage_value
      property.mortgage = true
      owner.save
      property.save
    end
    redirect_to '/properties'
  end

  def pay_mortgage
    @properties = Property.all
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    if owner.cash >= property.mortgage_value
      owner.cash -= property.mortgage_value
      property.mortgage = false
      owner.save
      property.save
    else
      flash[:warning] = 'Not Enough Cash Stranger!'
    end
    redirect_to '/properties'
  end

  def build_house
    @properties = Property.all
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    if owner.cash >= property.property_price && property.number_of_houses < 4 && property.number_of_hotels == 0
      owner.cash -= property.house_price
      owner.save
      property.number_of_houses += 1
      property.save
    end
    redirect_to '/properties'
  end

  def sell_house
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    unless property.color == 'Railroad' || property.color == 'Utility'
      if property.number_of_houses > 0 && property.number_of_hotels == 0
        owner.cash += (property.house_price) / 2
        owner.save
        property.number_of_houses -= 1
        property.save
      end
    end
    redirect_to '/properties'
  end

  def build_hotel
    @properties = Property.all
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    if property.number_of_houses == 4 && owner.cash >= property.property_price
      owner.cash -= property.hotel_price
      owner.save
      property.number_of_houses = 0
      property.number_of_hotels = 1
      property.save
    else
      flash[:warning] = 'Not Enough Cash Stranger!'
    end
    redirect_to '/properties'
  end

  def sell_hotel
    property = Property.find(params[:id])
    owner = Player.find(property.player.id)
    unless property.color == 'Railroad' || property.color == 'Utility'
      if property.number_of_hotels == 1
        owner.cash += property.hotel_price
        owner.save
        property.number_of_hotels = 0
        property.save
      end
    end
    redirect_to '/properties'
  end

  def pay_rent
    @property = Property.find(params[:id])
  end

  def complete_pay_rent_transaction
    property = Property.find(params[:id])
    owner = Player.find(property.player_id)
    renter = Player.find(params[:player][:player_id])

    if property.color == 'Railroad'
      amount = railroad_rent(property)
    else
      amount = current_rent(property)
    end

    renter.cash -= amount
    renter.save
    owner.cash += amount
    owner.save
    p params
    redirect_to '/players'
  end

  private

  def property_params
    params.require(:property).permit(:player_id, :owned, :number_of_houses, :number_of_hotels)
  end

end
