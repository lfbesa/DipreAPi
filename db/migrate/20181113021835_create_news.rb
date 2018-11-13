class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.date :publishedAt
      t.string :source
      t.string :urlToImage
      t.string :url

      t.timestamps
    end
  end
end
