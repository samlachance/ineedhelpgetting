class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :item_id
      t.integer :client_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
