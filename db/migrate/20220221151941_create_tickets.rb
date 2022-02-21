class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :number
      t.integer :train_id
      t.integer :route_id
      t.integer :user_id

      t.timestamps
    end
  end
end
