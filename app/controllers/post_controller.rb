class PostController < Controller
  def index
    @post = Post.all
  end
end