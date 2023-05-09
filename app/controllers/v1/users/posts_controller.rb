class V1::Users::PostsController < V1::Users::BaseController

  #Get /posts
  def index
    posts = Post.all
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

  private

  def post_params
    params
    .require(:post)
    .permit(
        :title, :body
    )
  end
end
