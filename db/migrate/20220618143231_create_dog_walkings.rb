class CreateDogWalkings < ActiveRecord::Migration[7.0]
  def change
    create_table :dog_walkings do |t|
      t.string :status
      t.date :appointment_date
      t.float :price
      t.integer :duration
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.date :start_tour
      t.date :end_tour

      t.timestamps
    end
  end
end
