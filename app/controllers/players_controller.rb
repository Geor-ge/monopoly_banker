class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def pay_rent
    @property = Property.find(params[:id])
    owner = @property.player
    player = Player.find(params[:property][:player_id])
  end

  def pay_utility
  end

end
