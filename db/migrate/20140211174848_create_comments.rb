class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :product, index: true
      t.text :content
      t.integer :mark
      t.string :name

      t.timestamps
    end
  end
end
