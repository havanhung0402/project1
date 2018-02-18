class QuestionsController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :new]
   before_action :admin_user, only: [:edit, :update, :new , :destroy]
   before_action :question_exist, only: [:show, :edit, :update , :destroy]
  def index
    @question = Question.page params[:page]
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = t "controllers.question_create"
      redirect_to questions_url
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes question_params
      flash[:success] = t "controllers.question_update"
      redirect_to questions_url
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t "controllers.question_delete"
    redirect_to request.referrer || root_url
  end
  private

    def question_params
      params.require(:question).permit :text
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = t "controllers.please_login"
        redirect_to login_url
      end
    end
    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def question_exist
      @question = Question.find(params[:id])
    end
end
