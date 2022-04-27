class RemoveNameColFromTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :name
  end
end
