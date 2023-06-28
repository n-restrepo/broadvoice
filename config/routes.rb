# frozen_string_literal: true

Rails.application.routes.draw do

  scope :api do
    scope :sells do
      get '', to: 'sells#read'
    end
  end
end
