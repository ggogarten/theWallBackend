class WallPostsController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :set_wall_post, only: [:show, :update, :destroy]
  before_filter :authenticate_user_from_token, except: [:token, :index]
  # before_action :set_wall_post, only: [:update, :destroy]


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
    @wall_post.username = @signed_in_user.username

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



    private

    def authenticate_user_from_token
      unless authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
        render json: { error: 'Bad Token'}, status: 401
      end
    end
end
