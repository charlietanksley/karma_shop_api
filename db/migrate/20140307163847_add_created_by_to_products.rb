class AddCreatedByToProducts < ActiveRecord::Migration
  def change
    add_column :products, :created_by, :integer, index: true
  end
end
