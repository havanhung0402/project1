class ChoicesController < ApplicationController
  before_action :question_exists,   only: [:create, :destroy]
  def create
   text = params[:text]
   correct = params[:correct] == "1"
   new = Choice.create(:text => text, :correct => correct,
                       :question_id => @question.id)
   if new.correct
    @question.answer = new
   end
   redirect_to question_path(@question)
  end

  def destroy
   @choice = Choice.find params[:choice]
   @choice.destroy
   redirect_to question_path(@question)
  end
  private
   def question_exists
     @question = Question.find params[:question]
   end
end

