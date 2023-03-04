class RemoveDescriptionFromDestination < ActiveRecord::Migration[7.0]
  def change
    remove_column :destinations, :description, :text
  end
end
