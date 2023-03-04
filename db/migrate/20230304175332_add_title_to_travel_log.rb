class AddTitleToTravelLog < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_logs, :title, :string, limit: 100
  end
end
