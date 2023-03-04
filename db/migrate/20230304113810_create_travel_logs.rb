class CreateTravelLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_logs do |t|
      t.string :category
      t.string :destination
      t.text :description
      t.string :image
      t.string :main_attraction

      t.timestamps
    end
  end
end
