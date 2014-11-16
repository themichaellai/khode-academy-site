class LessonsController < ApplicationController
  layout 'application'

  def index
    @lesson_module = LessonModule.find(params[:lesson_module_id])
    @lessons = @lesson_module.lessons
    if user_signed_in?
      progresses = LessonProgress.where(lesson_id: @lessons.map(&:id))
      @progresses_map = Hash[*progresses.map { |p| [p.lesson.id, p] }.flatten]
    else
      @progresses_map = {}
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    if user_signed_in?
      progresses = LessonProgress.where(user: current_user, lesson: @lesson).limit(1)
      if progresses.length == 0
        @progress = LessonProgress.new(user: current_user, lesson: @lesson)
        @progress.save
      else
        @progress = progresses.first
      end
    end
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

  def update_progress
    if user_signed_in?
      @lesson = Lesson.find(params[:lesson_id])
      progresses = LessonProgress.where(user: current_user, lesson: @lesson).limit(1)
      if progresses.length == 0
        @progress = LessonProgress.new(user: current_user, lesson: @lesson, code: params[:code])
        @progress.save
      else
        @progress = progresses.first
        @progress.update_attribute(:code, params[:code])
      end
    end
    render text: 'ok'
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
