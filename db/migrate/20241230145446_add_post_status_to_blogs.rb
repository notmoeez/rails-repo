class AddPostStatusToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :status, :integer, default: 0
  end
end
