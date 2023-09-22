class RatingsController < ApplicationController
  # app/controllers/ratings_controller.rb
  def index
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @ratings = @post.ratings
    end
  def new
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @rating = @post.ratings.new
      # @comment = Comment.new(comment_params)
  end
  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @rating = @post.ratings.find(params[:id])
    # @comment = Comment.new(comment_params)
  end
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @rating= @post.ratings.find(params[:id])
  end
    def create
      @topic = Topic.find(params[:topic_id])
      @post = p@topic.posts.find(params[:post_id])
      @rating = @post.ratings.build(rating_params)

  respond_to do |format|
    if @rating.save
      format.html { redirect_to [@topic, @post, @rating], notice: 'Comment was successfully created.' }
      # format.json { render :show, status: :created, location: @comment }
    else
      render 'posts/show'
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end
    def update
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @rating = Rating.find(params[:id])

      respond_to do |format|
        if @rating.update(rating_params)
          format.html { redirect_to [@topic,@post,@rating], notice: 'Rating was successfully updated.' }
          # format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
    def destroy
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @rating = Rating.find(params[:id])


       @rating.destroy
      #   flash[:success] = 'Rating deleted successfully.'
      # else
      #   flash[:error] = 'Failed to delete rating.'
      # end
      #
      # redirect_to @post
      respond_to do |format|
        format.html { redirect_to topic_post_ratings_path, notice: 'Rating was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def rating_params
      params.require(:rating).permit(:rating_value)
    end
  end

