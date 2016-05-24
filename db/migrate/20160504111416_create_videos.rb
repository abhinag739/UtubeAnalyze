class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.datetime :published_at
      t.integer :likes
      t.integer :dislikes
      t.string :uid
      t.integer :comment_count
      t.text :comments, serialize :comments, JSON 
      t.timestamps
    end
    add_index :videos, :uid
  end
end
