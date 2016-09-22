class AddUsernamesToWallPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :wall_posts, :username, :string
  end
end
