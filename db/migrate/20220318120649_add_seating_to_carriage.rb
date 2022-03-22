class AddSeatingToCarriage < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :seating, :integer
  end
end
