class CreateTreasureShelf < ActiveRecord::Migration
  def change
    create_table :treasure_shelves do |t|
      t.references :customer, index: true

      t.timestamps
    end
  end
end
