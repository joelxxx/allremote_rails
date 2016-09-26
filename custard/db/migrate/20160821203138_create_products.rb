class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :facility_id
      t.string :flavor
      t.integer :mid
      t.string :state
      t.datetime :packaged
      t.datetime :opened

      t.timestamps null: false
    end
  end
end
