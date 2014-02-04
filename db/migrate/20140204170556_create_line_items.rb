class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
      t.integer :quantity
      t.float :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
