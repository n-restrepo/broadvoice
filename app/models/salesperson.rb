# frozen_string_literal: true

# Salesperson Application Model
class Salesperson < ApplicationRecord
  has_many :sells
end
