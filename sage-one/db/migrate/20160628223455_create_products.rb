class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string    :name, null: false
      t.string    :category
      t.string    :external_code
      t.text      :description
      t.string    :barcode
      t.string    :ncm
      t.string    :unit
      t.decimal   :value, scale: 2, precision: 8
      t.integer   :quantity, default: 0

      t.timestamps null: false
    end

    add_index :products, :name, unique: true
  end
end
