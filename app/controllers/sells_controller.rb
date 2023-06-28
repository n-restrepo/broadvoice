# frozen_string_literal: true

# API Controller for Sell entity endpoints
class SellsController < ApplicationController
  def read
    request_params = params.permit(
      :salesperson_name, :from, :to, :product_code, :customer_email, :state, :city, :page, :page_size
    )

    sells = SellsHelper.read(
      costumer_email: request_params[:costumer_email],
      salesperson_name: request_params[:salesperson_name],
      from: request_params[:from],
      to: request_params[:to],
      product_code: request_params[:product_code],
      state: request_params[:state],
      city: request_params[:city]
    )

    render json: sells
  end
end
