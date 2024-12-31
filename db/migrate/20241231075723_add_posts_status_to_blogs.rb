class AddPostsStatusToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :posts_status, :integer, default: 0
  end
end
