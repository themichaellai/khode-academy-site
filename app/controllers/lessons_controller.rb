class LessonsController < ApplicationController
  layout 'application'

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    render layout: 'lessons'
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render 'new'
    end
  end

  def new
    @lesson = Lesson.new
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render 'edit'
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(
      :title,
      :description,
      :lesson_text,
      :instructions,
      :boilerplate_code
    )
  end
end
