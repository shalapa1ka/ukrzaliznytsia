class AddReverseToTrains < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :reverse, :boolean
  end
end
