json.extract! dog_walking, :id, :appointment_date, :price, :duration, :latitude, :longitude, :start_tour, :end_tour
json.dogs dog_walking.dogs.pluck(:name)
