class PostsController < ApplicationController

def index
  @posts = Post.all
end

def show
  @post = Post.find(params[:id])
  @comment = Comment.new

end

def new
  @post = Post.new
end

def edit
  @post = Post.find(params[:id])
end

def create
  @post = Post.create!(post_params)
  redirect_to post_path(@post)
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

private
def post_params
  params.require(:post).permit(:title, :text, :img_url)
end

end
