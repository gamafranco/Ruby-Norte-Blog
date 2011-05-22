class Comment < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    content :text, :required => true
    timestamps
  end

  belongs_to :post

  belongs_to :owner, :class_name=> "User", :creator => true


  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || (acting_user.signed_up? && owner.is?(acting_user))
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
