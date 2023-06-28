# frozen_string_literal: true

# create Costumers model table
class CreateCostumers < ActiveRecord::Migration[6.1]
  def change
    create_table :costumers do |t|
      t.string :name
      t.string :email

      t.timestamps
      t.index :email, unique: true
    end
  end
end
