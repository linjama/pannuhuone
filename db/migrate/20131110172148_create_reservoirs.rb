class CreateReservoirs < ActiveRecord::Migration
  def change
    create_table :reservoirs do |t|

      t.timestamps
    end
  end
end
