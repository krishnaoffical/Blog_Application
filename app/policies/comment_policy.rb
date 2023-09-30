# app/policies/comment_policy.rb
class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    user == comment.user
  end

  def update?
    edit?
  end

  def destroy?
    user == comment.user
  end

end
