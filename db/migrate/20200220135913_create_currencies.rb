class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.index :code, unique: true
      
      t.timestamps
    end
  end
end
