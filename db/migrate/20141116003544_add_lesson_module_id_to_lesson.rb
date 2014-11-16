class AddLessonModuleIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_module_id, :integer
  end
end
