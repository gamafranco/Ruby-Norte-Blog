class Post < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string, :required => true
    content :html, :required => true
    timestamps
  end

  belongs_to :owner, :class_name=> "User", :creator => true

  has_many :comments

  children :comments

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? && owner_is?(acting_user)
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
