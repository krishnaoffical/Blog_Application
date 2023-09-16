class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
      t.datetime :date
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
