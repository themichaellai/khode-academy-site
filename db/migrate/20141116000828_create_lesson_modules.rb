class CreateLessonModules < ActiveRecord::Migration
  def change
    create_table :lesson_modules do |t|
      t.string :title
      t.string :teaser
      t.string :description
      t.string :language

      t.timestamps
    end
  end
end
