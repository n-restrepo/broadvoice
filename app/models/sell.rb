# frozen_string_literal: true

# Sell Application Model
class Sell < ApplicationRecord
  belongs_to :product
  belongs_to :costumer
  belongs_to :salesperson

end
