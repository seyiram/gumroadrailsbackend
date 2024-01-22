class AddUserProductNumberToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :user_product_number, :integer
  end
end
