class UsersController < ApplicationController
 before_action :find_user, only: [:show, :update,:destroy, :edit]
 before_action :verify_admin!, only: [:destroy, :index, :edit, :update]
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user, only: [:edit, :update]
 before_action :get_all_type_user, only: [:new, :create]

  def show
    if @user.present?
      @posts = @user.posts.paginate page: params[:page]
    else
      flash[:danger] = t "controllers.not_found_post"
      redirect_to root_url
    end
  end

  def index
     @users = User.page params[:page]
  end

  def signup
    @user = User.new
  end

  def new
    @user = User.new
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controllers.profile_update"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "controllers.Profile_delete"
    redirect_to users_url
  end

  def create
   @user = User.new user_params
    if @user.save
      flash[:success] = t "controllers.signup_sc"
      if logged_in? 
        if current_user.admin?
          redirect_to users_path
        else
          redirect_to root_url
        end
      end
    else
      if logged_in? 
        if current_user.admin?
          render :new
        else
          render :signup
        end
      end
      
    end
  end

  private

    def user_params
      params.require(:user).permit :name,:email,:address,:birthday,:phone, :password,
        :password_confirmation, :admin
    end

     def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = t "controllers.please_login"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find_by id: params[:id]
      redirect_to root_url unless current_user? @user
    end

    def find_user
      @user = User.find_by id: params[:id]
      if !@user.present?
        flash[:danger] = t "controllers.not_found_user"
        redirect_to root_url
      end
    end

    def get_all_type_user
      @type_user = Type.all
    end
end
