class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 10, scale: 2, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.references :customer, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end