class AddRatingToUserCommentRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :user_comment_ratings, :rating, :integer
  end
end
