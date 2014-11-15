class AddDescriptionToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :description, :string
  end
end
