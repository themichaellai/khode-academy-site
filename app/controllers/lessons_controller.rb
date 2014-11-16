class LessonsController < ApplicationController
  layout 'application'

  def index
    @lesson_module = LessonModule.find(params[:lesson_module_id])
    @lessons = @lesson_module.lessons
  end

  def show
    @lesson = Lesson.find(params[:id])
    render layout: 'lessons'
  end

  def create
    @lesson_module = LessonModule.find(params[:lesson_module_id])
    @lesson = @lesson_module.lessons.build(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render 'new'
    end
  end

  def new
    @lesson_module = LessonModule.find(params[:lesson_module_id])
    @lesson = @lesson_module.lessons.build
    @lesson.tests.build

    render layout: 'lessons'
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
      :boilerplate_code,
      tests_attributes: [:id, :name, :arg_a, :arg_b, :test_type]
    )
  end
end
