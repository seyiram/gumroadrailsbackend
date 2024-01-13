class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :url
      t.string :custom_domain
      t.string :cover_image
      t.string :thumbnail_image
      t.string :type
      t.string :call_to_action
      t.decimal :price, precision: 10, scale: 2
      t.string :currency

      t.timestamps
    end
  end
end
