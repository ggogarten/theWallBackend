class AddUserRefToWallPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :wall_posts, :user, foreign_key: true
  end
end
