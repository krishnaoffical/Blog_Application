# frozen_string_literal: true
class CommentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]

  # GET /comments or /comments.json
  def index
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments.includes(:user)
  end


  # GET /comments/1 or /comments/1.json
  def show

    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new
    # @comment = Comment.new(comment_params)
  end

  # GET /comments/1/edit
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    # authorize @comment

  end

  # POST /comments or /comments.json
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

      if @comment.save
        redirect_to topic_post_path(@topic, @post), notice: "Comment was successfully created."
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment

      if @comment.update(comment_params)
        redirect_to topic_post_path(@topic, @post), notice: "Comment was successfully updated."
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  # DELETE /comments/1 or /comments/1.json
  def destroy

    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
    @comment.destroy
    redirect_to topic_post_path(@topic, @post), notice: "Comment was successfully deleted."
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :topic_id)
  end

end
