class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.references :user

      t.timestamps
    end
  end
end
