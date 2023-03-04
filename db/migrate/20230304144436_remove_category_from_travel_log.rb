class RemoveCategoryFromTravelLog < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_logs, :category, :string
  end
end
