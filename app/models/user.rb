class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :mother_quests, :class_name => "Quest", :foreign_key => "mother_id"  
  has_many :father_quests, :class_name => "Quest", :foreign_key => "father_id"  
  has_many :mother_prenatals, :class_name => "Prenatal", :foreign_key => "mother_id"  
  has_many :father_prenatals, :class_name => "Prenatal", :foreign_key => "father_id"
  has_many :mother_orders, :class_name => "Order", :foreign_key => "mother_id"  
  has_many :father_orders, :class_name => "Order", :foreign_key => "father_id"
  has_one  :father_parent, :class_name => "parent", :foreign_key => "father_id"
  has_one  :mother_parent, :class_name => "parent", :foreign_key => "mother_id"


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        #user.fb_raw_data = auth
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.save!
     return user
   end
end
