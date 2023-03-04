class RemoveNameFromDestination < ActiveRecord::Migration[7.0]
  def change
    remove_column :destinations, :name, :string
  end
end
