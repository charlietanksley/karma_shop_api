class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :attribution_text
      t.string :attribution_url
      t.string :name, null: false
      t.integer :price, null: false, default: 0
      t.string :src, null: false
    end
  end
end
