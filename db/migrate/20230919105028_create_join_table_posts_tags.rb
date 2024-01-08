class CreateJoinTablePostsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_tags, id: false do |t|
      t.integer :post_id
      t.integer :tag_id
    end

    add_foreign_key :posts_tags, :posts
    add_foreign_key :posts_tags, :tags
  end
end
