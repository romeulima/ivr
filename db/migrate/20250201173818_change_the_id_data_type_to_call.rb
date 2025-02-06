class ChangeTheIdDataTypeToCall < ActiveRecord::Migration[8.0]
  def up
    remove_column :calls, :id
    add_column :calls, :id, :string, primary_key: true
  end

  def down
    remove_column :calls, :id
    add_column :calls, :id, :bigint, primary_key: true
  end
end
