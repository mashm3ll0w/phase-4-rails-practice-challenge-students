class InstructorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :instructor_not_found
  def index
    render json: Instructor.all, status: :ok
  end

  def show
    instructor = find_instructor
    render json: instructor,
           serializer: InstructorWithStudentsSerializer,
           status: :ok
  end

  def destroy
    instructor = find_instructor
    instructor.destroy
    head :no_content
  end

  private

  def find_instructor
    Instructor.find(params[:id])
  end

  def instructor_not_found
    render json: { error: "Instructor not found" }, status: :not_found
  end
end
