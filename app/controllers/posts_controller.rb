class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new,
    :edit, :update, :index_manager]
  before_action :correct_user, only: :destroy
  before_action :verify_admin!, only: [:create, :destroy, :new, :edit,
    :update, :index_manager]
  before_action :find_post, only: [:update, :edit]

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t "controllers.post_create"
      redirect_to managerposts_path
    else
      render :new
    end
  end
  def new
     @post = current_user.posts.build if logged_in?
  end

  def destroy
    @post.destroy
    flash[:success] = t "controllers.post_delete"
    redirect_to request.referrer || root_url
  end

  def index
    @posts = Post.select(:id, :title, :content, :picture,
      :updated_at).paginate page: params[:page], per_page: Settings.post_per_page
  end

  def index_manager
    @posts = Post.joins(:user).order(created_at: :desc).select(:id, :title,
      :picture, :name).paginate page: params[:page], per_page: Settings.post_per_page
  end

  def show
    @post = Post.select(:title, :content, :updated_at).find_by id: params[:id]
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t "controllers.post_update"
      redirect_to managerposts_path
    else
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit :content,:title, :picture
    end

    def correct_user
      @post = current_user.posts.find_by id: params[:id]
      redirect_to root_url if @post.nil?
    end

    def find_post
      @post = Post.find_by id: params[:id]
    end
end
