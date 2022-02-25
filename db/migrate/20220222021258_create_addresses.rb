class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string     :post_number,        null: false 
      t.string     :shipping_area_id,   null: false 
      t.string     :city,               null: false 
      t.string     :house_number,       null: false 
      t.string     :building,           null: false 

      t.string     :telephone,          null: false  
      t.references :purchase,           null: false, foreign_key: true 

      t.timestamps
    end
  end
end
