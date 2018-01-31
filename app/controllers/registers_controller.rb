class RegistersController < ApplicationController
  before_action :get_all_course, only: [:new, :create]
  def new
    @register = Register.new
  end

  def create
    @register = Register.new register_params
    if @register.save
      flash[:success] = t "views.register.success_register"
      redirect_to root_url
    else
      render :new
    end
  end
  
  def register_params
    params.require(:register).permit :name, :email, :phone, :birthday, :course_id
  end

  private

    def get_all_course
      @course = Course.select :id, :title 
    end
end
