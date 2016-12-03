class AddColumnToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :group, :string
    add_column :catalogs, :manufacturer, :string
    add_column :catalogs, :use_by_date, :date
  end
end
