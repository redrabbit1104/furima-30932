class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.text :info, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
