class AddToDateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :to_date, :string
    add_column :events, :url, :string
    add_column :events, :hour, :string
  end
end
