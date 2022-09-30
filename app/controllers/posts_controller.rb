class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:post][:content])
    if @post.save
      redirect_to posts_path, notice: "ツイート投稿完了！"
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
      redirect_to posts_path, notice: "ツイートを編集しました"
    else
      render :edit
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "ツイートを削除しました"
  end

  def confirm
    @post = Post.new(content: params[:post][:content])
  end

end
