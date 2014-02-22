class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.references :treasure_shelf, null: false, index: true
      t.references :product, null: false, index: true

      t.integer :purchase_price, null: false, default: 0
    end
  end
end
