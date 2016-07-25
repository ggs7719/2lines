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

  # def update
  #   @mood = Mood.find( params[:id])

  #   if @mood.update( mood_params )
  #     render :json => { :message => "Successfully updated"}
  #   else
  #     render :json => { :message => "Validate failed" }, :status => 400
  #   end
  # end

  def mood_params
    params.permit(:title, :content, :message)
  end
end
