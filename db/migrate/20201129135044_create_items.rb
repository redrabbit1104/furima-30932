class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.text :info, null: false
      
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shippingfee_id, null:false
      t.integer :shipplace_id, null: false
      t.integer :dateship_id, null: false

      t.integer :price, null: false
      t.integer :tax
      t.integer :profit
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
