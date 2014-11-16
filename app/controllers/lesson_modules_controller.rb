class LessonModulesController < ApplicationController
  def index
    @lesson_modules = LessonModule.all
  end

  def show
    @lesson_module = LessonModule.find(params[:id])
  end

  def new
    @lesson_module = LessonModule.new
  end

  def create
    @lesson_module = LessonModule.new(module_params)
    if @lesson_module.save
      redirect_to @lesson_module
    else
      render 'new'
    end
  end

  private
  def module_params
    params.require(:lesson_module).permit(
      :title,
      :teaser,
      :description,
      :language
    )
  end
end
