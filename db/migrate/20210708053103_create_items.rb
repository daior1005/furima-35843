class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :item_name, null: false
      t.text     :explain, null: false
      t.integer  :shipment_day_id, null: false
      t.integer  :category_id , null: false
      t.integer  :item_status_id  , null: false
      t.integer  :delivery_charge_id , null: false
      t.integer  :delivery_area_id , null: false
      t.integer  :cost, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
