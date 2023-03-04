class AddCategoryToDestination < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :category, :string
  end
end
