class UpdateCarriage < ActiveRecord::Migration[6.1]
  def change
    remove_column :carriages, :kind
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :number, :string
    add_column :carriages, :type, :string
  end
end
