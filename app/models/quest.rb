class Quest < ActiveRecord::Base
  belongs_to :mother, :class_name => "User", :foreign_key => "mother_id"
  belongs_to :father, :class_name => "User", :foreign_key => "father_id"
end
