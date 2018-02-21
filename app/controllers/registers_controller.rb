class RegistersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :index,
    :destroy]
  before_action :get_all_course, only: [:new, :create, :edit]
  before_action :admin_user, only: [:edit, :update, :destroy]
  before_action :find_register, only: [:update]
  def new
    @register = Register.new
  end

  def create
    @register = Register.new register_params
    if @register.save
      flash[:success] = t "controllers.success_register"
      if logged_in?
        if current_user.admin?
        redirect_to managerregisters_path
        else 
          redirect_to root_url
        end
      else
        redirect_to root_url
      end
    else
      render :new
    end
  end

  def index
    @registers = Register.joins(:course).select(:id, :name, :email, :birthday, :phone,
      :title).paginate page: params[:page], per_page: Settings.register_per_page
  end

  def edit
    @register = Register.find_by id: params[:id]
  end

  def update
    if @register.update_attributes register_params
      flash[:success] = t "controllers.register_update"
      redirect_to managerregisters_path
    else
      render :edit
    end
  end

  def destroy
    Register.find_by(id: params[:id]).destroy
    flash[:success] = t "controllers.delete_register"
    redirect_to managerregisters_path
  end

  private

    def register_params
      params.require(:register).permit :name, :email, :phone, :birthday, :course_id
    end

    def get_all_course
      @course = Course.select :id, :title 
    end

    def find_register
      @register = Register.find_by id: params[:id]
    end
end
