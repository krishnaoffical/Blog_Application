class UserCommentRating < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  validates :user_id, uniqueness: { scope: :comment_id, message: "You've already rated this comment." }
end
