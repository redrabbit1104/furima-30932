class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code ,null: false
      t.string :city, null: false
      t.string :blocknum, null: false
      t.string :building
      t.string :tel, null: false

      t.integer :shipplace_id, null: false
      
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
