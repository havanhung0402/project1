class PostsController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy]
 before_action :correct_user,   only: :destroy
 before_action :admin_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t "controllers.post_create"
      redirect_to root_url
    else
      render :cre
    end
  end
  def cre
     @post = current_user.posts.build if logged_in?
  end

  def destroy
    @post.destroy
    flash[:success] = t "controllers.post_delete"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit :content,:title, :picture
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
    def admin_user
      redirect_to root_url unless current_user.admin?
    end

end
