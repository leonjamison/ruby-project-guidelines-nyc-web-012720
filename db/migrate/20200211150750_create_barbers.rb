class CreateBarbers < ActiveRecord::Migration[5.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.integer :experience
      t.string :style
      t.string :price
      t.integer :shop_id 
    end
  end
end
