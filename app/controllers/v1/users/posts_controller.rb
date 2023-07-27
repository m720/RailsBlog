class V1::Users::PostsController < V1::Users::BaseController
  before_action :set_post, only: %i(show)
  before_action :set_user_post, only: %i(destroy update)
  #Get /posts
  def index
    posts = Post.all
    posts = posts.by_user_id(params[:user_id]) if params[:user_id].present?
    paginate(collection: posts)
  end

  #POST /posts
  def create
    post =  Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @post
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      head(:ok)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params
      .require(:post)
      .permit(
          :title, :body
      )
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def set_user_post
      @post = current_user.posts.find(params[:id])
    end
end
