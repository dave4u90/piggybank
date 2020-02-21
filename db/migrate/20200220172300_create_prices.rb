class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.decimal :volume_24h, null: false, precision: 10, scale: 3
      t.decimal :volume, null: false, precision: 10, scale: 3
      t.datetime :transition_time, null: false
      t.string :status, null: false
      t.integer :session, null: false
      t.decimal :prev_close, null: false, precision: 10, scale: 3
      t.decimal :last, null: false, precision: 10, scale: 3
      t.datetime :current_time, null: false
      t.decimal :bid, null: false, precision: 10, scale: 3
      t.decimal :ask, null: false, precision: 10, scale: 3

      t.integer :currency_id, null: false

      t.index :currency_id
      t.index :current_time
      t.index :last
      
      t.timestamps
    end
  end
end
