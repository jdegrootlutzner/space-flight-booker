class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :duration
      t.integer :price
      t.references :from
      t.references :to

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :from_id
    add_foreign_key :flights, :airports, column: :to_id
  end
end
