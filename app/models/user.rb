class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :mother_quests, :class_name => "Quest", :foreign_key => "mother_id"
  has_many :father_quests, :class_name => "Quest", :foreign_key => "father_id"
  has_many :mother_prenatals, :class_name => "Prenatal", :foreign_key => "mother_id"
  has_many :father_prenatals, :class_name => "Prenatal", :foreign_key => "father_id"
  has_many :mother_moods, :class_name => "Mood", :foreign_key => "mother_id"
  has_many :father_moods, :class_name => "Mood", :foreign_key => "father_id"
  has_many :mother_psychos, :class_name => "Psycho", :foreign_key => "mother_id"
  has_many :father_psychos, :class_name => "Psycho", :foreign_key => "father_id"

  has_one :mother_parent, :class_name => "Parent", :foreign_key => "mother_id"
  has_one :father_parent, :class_name => "Parent", :foreign_key => "father_id"


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  before_create :generate_ios_token


  # before_create :generate_father_id

  # 註冊後檢查是否有mother_id
  # def generate_father_id
  #   if params[:mother_id]
  #     parent = Parent.find_by(:mother_id => params[:mother_id])
  #     parent.update(:father_id => self.id)
  #   else
  #     parent = Parent.create(:mother_id => self.id)
  #   end
  # end

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

   def generate_ios_token
     self.ios_token = Devise.friendly_token
   end
end
