class UsersController < ApplicationController

 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user, only: [:edit, :update]
 before_action :admin_user, only: :destroy

  def show
    @user = User.find params[:id]
    @posts = @user.posts.paginate page: params[:page]
  end

  def index
     @users = User.page params[:page]
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "controllers.profile_update"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t "controllers.Profile_delete"
    redirect_to users_url
  end

  def create
   @user = User.new user_params
    if @user.save
      flash[:success] = t "controllers.signup_sc"
      redirect_to root_url
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit :name,:email,:address,:birthday,:phone, :password,
                                   :password_confirmation
    end

     def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = t "controllers.please_login"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find params[:id]
      redirect_to root_url unless current_user? @user
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end