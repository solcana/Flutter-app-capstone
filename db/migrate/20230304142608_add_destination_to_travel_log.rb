class AddDestinationToTravelLog < ActiveRecord::Migration[7.0]
  def change
    add_reference :travel_logs, :destination, null: false, foreign_key: true
  end
end
