class WallPostsController < ApplicationController
  before_action :set_wall_post, only: [:show, :update, :destroy]

  # GET /wall_posts
  def index
    @wall_posts = WallPost.all

    render json: @wall_posts
  end

  # GET /wall_posts/1
  def show
    render json: @wall_post
  end

  # POST /wall_posts
  def create
    @wall_post = WallPost.new(wall_post_params)

    if @wall_post.save
      render json: @wall_post, status: :created, location: @wall_post
    else
      render json: @wall_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wall_posts/1
  def update
    if @wall_post.update(wall_post_params)
      render json: @wall_post
    else
      render json: @wall_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wall_posts/1
  def destroy
    @wall_post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wall_post
      @wall_post = WallPost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wall_post_params
      params.require(:wall_post).permit(:postMsg)
    end
end
