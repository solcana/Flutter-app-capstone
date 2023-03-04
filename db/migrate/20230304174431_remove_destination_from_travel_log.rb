class RemoveDestinationFromTravelLog < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_logs, :destination, :string
  end
end
