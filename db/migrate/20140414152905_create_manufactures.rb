class CreateManufactures < ActiveRecord::Migration
  def change
    create_table :manufactures do |t|
      t.string :name,     null:false
      t.string :country,  null:false

      t.timestamps
    end
  end
end
