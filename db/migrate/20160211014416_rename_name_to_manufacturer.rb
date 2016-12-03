class RenameNameToManufacturer < ActiveRecord::Migration
  def change
   rename_column :manufacturers, :name, :manufacturer_name
  end
end
