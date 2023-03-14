# frozen_string_literal: true

class AddRefToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :role, null: false, foreign_key: true, default: 1
  end
end