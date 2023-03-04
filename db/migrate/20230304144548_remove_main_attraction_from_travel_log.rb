class RemoveMainAttractionFromTravelLog < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_logs, :main_attraction, :string
  end
end
