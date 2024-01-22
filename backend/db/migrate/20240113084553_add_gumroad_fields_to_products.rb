class AddGumroadFieldsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :custom_permalink, :string
    add_column :products, :custom_receipt, :text
    add_column :products, :custom_summary, :text
    add_column :products, :customizable_price, :boolean
    add_column :products, :deleted, :boolean
    add_column :products, :max_purchase_count, :integer
    add_column :products, :preview_url, :string
    add_column :products, :require_shipping, :boolean
    add_column :products, :subscription_duration, :string
    add_column :products, :published, :boolean
    add_column :products, :gumroad_id, :string
    add_column :products, :short_url, :string
    add_column :products, :thumbnail_url, :string
    add_column :products, :formatted_price, :string
    add_column :products, :file_info, :json
    add_column :products, :sales_count, :integer
    add_column :products, :sales_usd_cents, :integer
    add_column :products, :is_tiered_membership, :boolean
    add_column :products, :recurrences, :json
    add_column :products, :tags, :string, array: true, default: []
    add_column :products, :purchasing_power_parity_prices, :json
    add_column :products, :variants, :json


    add_column :products, :custom_fields, :json
  end
end
