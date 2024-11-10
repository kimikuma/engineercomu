class PostsController < ApplicationController


  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def show
    @post=Post.find(params[:id])
  end

  def index
    @posts=Post.all
  end


  def destroy
    @post=Post.find(params[:id])
    @post.destroy
  end

  private
   def post_params
     params.require(:post).permit(:content)
   end



end
