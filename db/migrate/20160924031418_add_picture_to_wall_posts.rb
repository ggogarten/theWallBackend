class AddPictureToWallPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :wall_posts, :picture, :string
  end
end
