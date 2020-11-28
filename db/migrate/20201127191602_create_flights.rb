class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :duration
      t.integer :price
      t.references :from, foreign_key: true
      t.references :to, foreign_key: true

      t.timestamps
    end
  end
end
