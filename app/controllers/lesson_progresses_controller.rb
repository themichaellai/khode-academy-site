class LessonProgressesController < ApplicationController
  before_action :authenticate_user!

  def complete
    @progress = LessonProgress.where(user: current_user, lesson: params[:lesson_id]).limit(1)
    if @progress
      @progress.first.update_attribute(:completed, true)
    else
      @progress = LessonProgress.new(user: current_user, lesson: params[:lesson_id])
      @progress.save
    end
    render text: 'ok'
  end
end
