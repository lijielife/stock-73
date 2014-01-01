class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
      t.integer :sum

      t.timestamps
    end
  end
end
