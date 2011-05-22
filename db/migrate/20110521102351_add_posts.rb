class AddPosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string   :title, :required => true
      t.text     :body, :required => true
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :owner_id
    end
    add_index :posts, [:owner_id]
  end

  def self.down
    drop_table :posts
  end
end
