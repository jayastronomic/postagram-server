class CreatePosts < ActiveRecord::Migration[6.1]
    def change
      create_table :posts, id: :uuid do |t|
        t.string :content
        t.uuid :user_id
  
        t.timestamps
      end
    end
  end