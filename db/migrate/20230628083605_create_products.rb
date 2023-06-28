# frozen_string_literal: true

# create Product model table
class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end
