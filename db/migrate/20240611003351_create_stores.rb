class CreateStores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false

      t.timestamps
    end
  end
end