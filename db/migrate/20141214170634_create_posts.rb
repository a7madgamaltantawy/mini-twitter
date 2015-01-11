class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :posts, :user_idhttp://0.0.0.0:3000/users/1
  end
end
