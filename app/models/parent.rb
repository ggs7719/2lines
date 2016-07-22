class Parent < ActiveRecord::Base
  belongs_to :mother, :class_name => "User", :foreign_key => "mother_id"
  belongs_to :father, :class_name => "User", :foreign_key => "father_id"


  before_create :generate_parent_token

   def generate_parent_token
     self.token = Devise.friendly_token
   end

end
