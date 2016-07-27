class ApiV1::MoodsController < ApiController

  before_action :authenticate_user!

  def index
    @moods = Mood.where( :mother => current_user )
  end

  def create
    @mood = Mood.new( mood_params )
    @mood.mother = current_user

    f = Parent.find_by(:mother => current_user)
    @mood.father = f.father

    if @mood.save
      render :json => { :message => "Successfully created"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def destroy
    mood = Mood.find( params[:id] )
    mood.remove = true

    if mood.save
      render :json => { :message => "Successfully deleted",
                        :delete => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  def days_ago
    a = params[:days]
    @moods = Mood.where(:mother=> current_user ).where("created_at > ?", a.to_f.days.ago)
  end

  def send_read
    mood = Mood.find( params[:id] )
    mood.status = true

    if mood.save
      render :json => { :message => "Already readed",
                        :read_status => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  # def update
  #   @mood = Mood.find( params[:id])

  #   if @mood.update( mood_params )
  #     render :json => { :message => "Successfully updated"}
  #   else
  #     render :json => { :message => "Validate failed" }, :status => 400
  #   end
  # end

  def mood_params
    params.permit(:title, :content, :message, :pic)
  end
end
