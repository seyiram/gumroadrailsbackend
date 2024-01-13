class RenameTypeInProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :type, :product_type
  end
end
