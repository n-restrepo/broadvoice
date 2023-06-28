# frozen_string_literal: true

# create Salesperson model table
class CreateSalespeople < ActiveRecord::Migration[6.1]
  def change
    create_table :salespeople do |t|
      t.string :name
      t.string :email

      t.timestamps
      t.index :email, unique: true
    end
  end
end
