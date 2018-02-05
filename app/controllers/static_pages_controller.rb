class StaticPagesController < ApplicationController
  def home
  	@posts = Post.page params[:page]
  end

  def help
  end
end
