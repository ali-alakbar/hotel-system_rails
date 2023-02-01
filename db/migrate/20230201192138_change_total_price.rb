class ChangeTotalPrice < ActiveRecord::Migration[7.0]
  def change
        rename_column :rooms, :total_price, :price
  end
end
