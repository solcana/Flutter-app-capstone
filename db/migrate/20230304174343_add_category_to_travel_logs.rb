class AddCategoryToTravelLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_logs, :category, :string
  end
end
