class ChangeProductSrcType < ActiveRecord::Migration
  def up
    change_column :products, :src, :text
  end

  def down
    change_column :products, :src, :string
  end
end
