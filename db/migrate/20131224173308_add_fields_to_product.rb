class AddFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :price, :decimal, precision: 8, scale: 2
    add_column :products, :description, :text
    add_column :products, :image, :string
    add_reference :products, :category, index: true
    # add_column :products, :category_id, :integer
    # add_index :products, :category_id
  end
end
