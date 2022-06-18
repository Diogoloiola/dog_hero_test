class ChangeTypeStartTour < ActiveRecord::Migration[7.0]
  def up
    change_column :dog_walkings, :start_tour, :datetime
  end

  def down
    change_column :dog_walkings, :start_tour, :date
  end
end
