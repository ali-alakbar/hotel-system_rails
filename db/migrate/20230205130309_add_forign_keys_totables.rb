class AddForignKeysTotables < ActiveRecord::Migration[7.0]
  def change
        add_reference :rooms, :hotel, foreign_key: true
        add_reference :employees, :hotel, foreign_key: true
  end
end
