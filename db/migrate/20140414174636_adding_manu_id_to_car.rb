class AddingManuIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :manufacture_id, :integer
  end
end
