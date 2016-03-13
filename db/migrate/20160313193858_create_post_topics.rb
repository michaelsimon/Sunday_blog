class CreatePostTopics < ActiveRecord::Migration
  def change
    create_table :post_topics do |t|
      t.integer :post_id
      t.integer :topic_id
    end
  end
end
