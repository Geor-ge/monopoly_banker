class Property < ApplicationRecord
  belongs_to :player, optional: true
end
