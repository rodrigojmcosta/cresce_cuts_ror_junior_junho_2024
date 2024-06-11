class CreateStores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
