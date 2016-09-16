class CreateWallPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :wall_posts do |t|
      t.string :postMsg

      t.timestamps
    end
  end
end
