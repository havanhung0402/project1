class CoursesController < ApplicationController

  before_action :admin_user, only: [:new, :create, :edit]
  before_action :get_all_user, only: [:new, :create, :edit]
  before_action :find_course, only: [:update]

  def index
    @courses = Course.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.course_per_page
  end

  def show
    @course = find_by id: params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new params_course
    if @course.save
      flash[:success] = t "controllers.create_course_sc"
      redirect_to courses_url
    else
      render :new
    end
  end

  def edit
    @course = Course.find_by id: params[:id]
  end

  def update
    if @course.update_attributes params_course
      flash[:success] = t "controllers.course_update"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

    def params_course
      params.require(:course).permit :title, :content, :image, :price, :user_id
    end

    def get_all_user
      @users = User.select :id, :name
    end

    def find_course
      @course = Course.find_by id: params[:id]
    end
end
