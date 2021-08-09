class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
