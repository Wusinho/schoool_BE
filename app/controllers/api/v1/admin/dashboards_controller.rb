class Api::V1::Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin!, only: [:index]

  def index
    @total_students = Student.count
    @total_teachers = Teacher.count
    @total_courses = Course.count
    render json: {
      students: @total_students,
      teachers: @total_teachers,
      courses: @total_courses,
      course: api_v1_admin_courses_path,
    }
  end
end
