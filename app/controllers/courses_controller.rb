class CoursesController < ApplicationController
	
  def index
		@courses = Course.order(created_at: :desc).paginate page: params[:page],
			per_page: Settings.course_per_page
  end
end
