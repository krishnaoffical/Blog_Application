class PostsController < ApplicationController
  before_action :set_topic, only: %i[ show edit new update destroy ]
  before_action :set_post, only: %i[ show edit update destroy ]


  # GET /posts or /posts.json
  def index
    if params[:topic_id].present?
      # Handle the case when a topic_id is present in the route (e.g., /topics/:topic_id/posts)
      @topic = Topic.find_by(id: params[:topic_id])

      if @topic.nil?
        # Handle the case where the topic is not found, e.g., redirect to another page or display an error message.
        redirect_to root_path, alert: "Topic not found"
      else
        # Retrieve posts for the specified topic
        @posts = @topic.posts.paginate(page: params[:page], per_page:10)
        # @posts = @topic.posts.page(params[:page]).per(10)
      end
    else
      # Handle the case when there is no topic_id in the route (e.g., /posts)
      # Retrieve all posts
      #  @posts = Post.page(params[:page]).per(10)
      @posts = Post.paginate(page: params[:page], per_page: 10)
    end
  end
      # GET /posts/1 or /posts/1.json
  def show
    # @ratings = @post.ratings
    @average_rating = Rating.where(post_id: @post.id).group(:post_id).average(:rating_value)
    @ratings_grouped = @post.ratings.group(:rating_value).count
  end

  # GET /posts/new
  def new
    @post = @topic.posts.new
    # @rating = @post.ratings.new
  end

  # GET /posts/1/edit
  def edit
     # @post = @topic.posts.find(params[:id])
  end

  # POST /posts or /posts.json
    def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.build(post_params)

      tags_input = params[:post][:new_tag]

      # Split the input into an array of tag names using space as a delimiter
      tags_array = tags_input.split(/\s+/).map(&:strip).reject(&:empty?)

      # Create tags for each tag name in the array
      tags_array.each do |tag_name|
        existing_tag = Tag.find_by(tag: tag_name)
        if existing_tag
          # If the tag already exists, use its ID
          @post.tags << existing_tag
        else
          # If the tag doesn't exist, create a new tag
          tag = Tag.create(tag: tag_name)
          @post.tags << tag
        end
      end
    respond_to do |format|
      if @post.save
        format.html { redirect_to [@topic,@post], notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
      end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = @topic.posts.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_post_url(@topic), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_url(@topic), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  def set_topic
    @topic=Topic.find(params[:topic_id])
  end
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :content, :date,:image,tags_attributes: [:tag],tag_ids:[])

    end
  # def rating_params
  #   params.require(:rating).permit(:rating_value)
  #
  # end
  end
