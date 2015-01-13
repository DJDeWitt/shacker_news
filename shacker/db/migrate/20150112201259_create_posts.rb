class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
