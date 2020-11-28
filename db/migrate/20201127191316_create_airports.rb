class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :location, uniqueness: true
      t.string :abbreviation, uniqueness: true

      t.timestamps
    end
  end
end
