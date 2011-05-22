class RenamesBodyToContent < ActiveRecord::Migration
  def self.up
    rename_column :posts, :body, :content
  end

  def self.down
    rename_column :posts, :content, :body
  end
end
