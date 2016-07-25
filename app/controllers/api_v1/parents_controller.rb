class ApiV1::ParentsController < ApiController

  before_action :authenticate_user!

  def connect_father


    parent = current_user.build_mother_parent( :email => params[:email], :comment => params[:comment], :mother => current_user)
    parent.save

    if UserMailer.notify_father(parent).deliver_now!
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
