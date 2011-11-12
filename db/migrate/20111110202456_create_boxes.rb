class CreateBoxes < ActiveRecord::Migration
  def up
    create_table :boxes do |t|
      t.string  :description, :limit => 140
      t.references :warehouse
      
      t.timestamps
    end
  end
  
  def down
    drop_table :boxes
  end  
end
