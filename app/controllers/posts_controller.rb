class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:post][:content])
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(content: params[:post][:content])
      redirect_to posts_path
    else
      render :edit
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
