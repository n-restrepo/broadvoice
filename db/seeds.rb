# frozen_string_literal: true

require 'faker'

1000.times do
  Product.create!(
    code: Faker::Barcode.ean,
    name: Faker::Commerce.product_name,
    cost: Faker::Commerce.price(range: 100..2000.0 )
  )
end

100.times do
  Salesperson.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

end

2000.times do
  costumer = Costumer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  product = Product.offset(rand(Product.count)).first

  value = Faker::Commerce.price(range: product.cost...product.cost * 1.25)

  Sell.create!(
    product: product,
    costumer: costumer,
    salesperson: Salesperson.offset(rand(Salesperson.count)).first,
    profit: value - product.cost,
    value: value,
    city: Faker::Address.city,
    state: Faker::Address.state,
    sold_at: Faker::Time.between(from: DateTime.parse('10/05/2022'), to: DateTime.now)
  )
end
