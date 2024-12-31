class AddBadgeToSkills < ActiveRecord::Migration[8.0]
  def change
    add_column :skills, :badge, :text
  end
end
