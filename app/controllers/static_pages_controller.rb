class StaticPagesController < ApplicationController
  
  def home
    @posts = Post.order(created_at: :desc).select(:id, :picture, :title, :content).first 4
    @courses = Course.order(created_at: :desc).select(:id, :title, :image,
      :content).first 4
  end

  def help
  end
end
