class UpdateTicketsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :number
    remove_column :tickets, :route_id
    add_column :tickets, :name, :string
  end
end
