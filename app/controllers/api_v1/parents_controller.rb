class ApiV1::ParentsController < ApiController

  before_action :authenticate_user!

  def connect_father

    email = params[:email]
    comment = params[:comment]

    token = Devise.friendly_token[0,5]
    Parent.create( :mother => current_user, :token => token,
                  :email => email )
    #parent = current_user.connect_father(params[:email], params[:comment])
    #UserMailer.notify_father(p

    if UserMailer.notify_comment(email, current_user, comment).deliver_now!
      render :json => { :message => "Successfully delivered"}
    else
      render :json => { :message => "fail" }
    end
  end

  def info
    @father = current_user
    @types = params[:type]

    case params[:type]
      when  "moods"
        @datas = Mood.where( :father_id => @father.id )
      when  "psychos"
        @datas = Psycho.where( :father_id => @father.id )
      when  "quests"
        @datas = Quest.where( :father_id => @father.id)
      when  "prenatals"
        @datas = Prenatal.where( :father_id => @father.id)
          # Mood.where( :father_id => @father.id ).first
    end
  end




end
