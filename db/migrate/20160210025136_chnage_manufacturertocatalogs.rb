class ChnageManufacturertocatalogs < ActiveRecord::Migration
  def change
 
    rename_column :catalogs, :manufacturer, :manufacturer_id

    change_column :catalogs, :manufacturer_id, :integer, :limit => 11
 
  end
end