# frozen_string_literal: true

# create Sell model table
class CreateSells < ActiveRecord::Migration[6.1]
  def change
    create_table :sells do |t|
      t.bigint :costumer_id
      t.bigint :salesperson_id
      t.bigint :product_id
      t.string :city
      t.string :state
      t.decimal :profit
      t.decimal :value
      t.datetime :sold_at, precision: 6, null: false

      t.timestamps
    end
  end
end
