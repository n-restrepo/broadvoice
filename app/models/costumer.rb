# frozen_string_literal: true

# Costumer Application Model
class Costumer < ApplicationRecord
  has_many :sells
end
