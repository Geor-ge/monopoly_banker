module PropertiesHelper

  def current_rent(p)
    if p.number_of_hotels == 0
      if p.number_of_houses == 0
        amount = p.rent
      elsif p.number_of_houses == 1
        amount = p.rent_1
      elsif p.number_of_houses == 2
        amount = p.rent_2
      elsif p.number_of_houses == 3
        amount = p.rent_3
      elsif p.number_of_houses == 4
        amount = p.rent_4
      end
    else
      amount = p.rent_hotel
    end
    return amount
    puts amount
  end

  def railroad_rent(p)
    if p.player.number_of_railroads == 1
      amount = p.rent_1
    elsif p.player.number_of_railroads == 2
      amount = p.rent_2
    elsif p.player.number_of_railroads == 3
      amount = p.rent_3
    elsif p.player.number_of_railroads == 4
      amount = p.rent_4
    end
  end


end
