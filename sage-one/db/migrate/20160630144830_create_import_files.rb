class CreateImportFiles < ActiveRecord::Migration
  def change
    create_table :import_files do |t|
      t.string :file, null: false

      t.timestamps null: false
    end
  end
end
