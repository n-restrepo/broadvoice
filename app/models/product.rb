# frozen_string_literal: true

# Product Application Model
class Product < ApplicationRecord
  has_many :sells
end
