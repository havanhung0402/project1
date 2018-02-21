class StaticPagesController < ApplicationController

  def home
    @posts = Post.order(created_at: :desc).select(:id, :picture, :title, :content).first 4
    @courses = Course.order(created_at: :desc).select(:id, :title, :image,
      :content).first 4
  end

  def index
    @course= Course.search(params[:search], params[:title])
    @post= Post.search(params[:search], params[:title])
  end

  def help
  end

  private

    def post_params
      params.require(:post).permit :content,:title, :picture
    end

    def course_params
      params.require(:course).permit :content,:title, :image, :price
    end
end
