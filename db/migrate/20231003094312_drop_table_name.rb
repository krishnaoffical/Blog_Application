class DropTableName < ActiveRecord::Migration[6.1]
  def change
    drop_table :posts_users_read_statuses
  end
end
