class ChangeTypeEndTour < ActiveRecord::Migration[7.0]
  def up
    change_column :dog_walkings, :end_tour, :datetime
  end

  def down
    change_column :dog_walkings, :end_tour, :date
  end
end
