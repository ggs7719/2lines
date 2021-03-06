class ApiV1::PsychosController < ApiController

  before_action :authenticate_user!

  def index
    @psychos = Psycho.where( :mother => current_user )
  end

  def create
    @psycho = Psycho.new( psycho_params )
    @psycho.mother = current_user

    f = Parent.find_by(:mother => current_user)
    @psycho.father = f.father

    if @psycho.save
      render :json => { :message => "Successfully created"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def destroy
    psycho = Psycho.find( params[:id] )
    psycho.remove = true

    if psycho.save
      render :json => { :message => "Successfully deleted",
                        :delete => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  def days_ago
    a = params[:days]
    @psychos = Psycho.where(:mother=> current_user ).where("created_at > ?", a.to_f.days.ago)
  end

  def sec_ago
    b = params[:sec]
    @psychos = Psycho.where(:mother=> current_user ).where("created_at > ?", b.to_f.seconds.ago)
  end

  def send_read
    psycho = Psycho.find( params[:id] )
    psycho.status = true

    if psycho.save
      render :json => { :message => "Already readed",
                        :read_status => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  def update
    @psycho = Psycho.find( params[:id])

    if @psycho.update( psycho_params )
      render :json => { :message => "Successfully updated"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def psycho_params
    params.permit(:title, :content, :message, :pic)
  end
end
