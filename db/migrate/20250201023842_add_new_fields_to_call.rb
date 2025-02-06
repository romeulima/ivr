class AddNewFieldsToCall < ActiveRecord::Migration[8.0]
  def change
    add_column :calls, :url, :string
    add_column :calls, :duration, :string
    add_column :calls, :status, :string
  end
end
