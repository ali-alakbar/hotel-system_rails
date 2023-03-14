# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name_ar
      t.string :name_en
      t.references :hotel, null: false, default: 0

      t.timestamps
    end
  end
end