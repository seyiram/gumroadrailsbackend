class CreateProductDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :product_details do |t|
      t.references :product, null: false, foreign_key: true
      t.string :attribute_name
      t.text :value

      t.timestamps
    end
  end
end
