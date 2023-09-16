class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.integer :publication_year
      t.string :published_by

      t.timestamps
    end
  end
end
