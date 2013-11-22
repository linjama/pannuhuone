class AddVolumeAndMassToReservoir < ActiveRecord::Migration
  def change
    add_column :reservoirs, :volume, :integer, default: 0
    add_column :reservoirs, :mass, :integer, default: 0
  end
end
