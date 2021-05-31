class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :post_id

      t.timestamps
    end
  end
end
