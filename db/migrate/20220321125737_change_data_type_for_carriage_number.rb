class ChangeDataTypeForCarriageNumber < ActiveRecord::Migration[6.1]
  def change
    change_column :carriages, :number, 'integer USING CAST(number AS integer)'

  end
end
