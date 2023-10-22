class UserCommentRatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic
  before_action :set_post
  before_action :set_comment


  def index
    @user_comment_ratings = @comment.user_comment_ratings
  end

  def create
    @user_comment_rating = @comment.user_comment_ratings.new(user_id: current_user.id)
    @user_comment_rating.rating = comment_rating_params[:rating]  # You need to specify where the rating value is coming from

    respond_to do |format|
      if @user_comment_rating.save
        format.html { redirect_to [@topic, @post], notice: 'Rating for the comment was saved successfully.' }
      else
        format.html { redirect_to [@topic, @post], alert: @user_comment_rating.errors.full_messages[0] }
      end
    end
  end
  # user_comment_ratings_controller.rb





  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
  private

  def comment_rating_params
    params.require(:user_comment_rating).permit(:rating)
  end

end
