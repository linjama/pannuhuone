class AddNameToReservoir < ActiveRecord::Migration
  def change
    add_column :reservoirs, :name, :string
  end
end
