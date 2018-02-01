class StaticPagesController < ApplicationController
  def home
    @posts = Post.page params[:page]
  end

  def help
  end

  private

    def post_params
      params.require(:post).permit :content,:title, :picture
    end
end
