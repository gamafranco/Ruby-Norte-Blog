class AddComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text     :content, :required => true
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :post_id
      t.integer  :owner_id
    end
    add_index :comments, [:post_id]
    add_index :comments, [:owner_id]
  end

  def self.down
    drop_table :comments
  end
end
