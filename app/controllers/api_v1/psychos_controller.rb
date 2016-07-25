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

  # def update
  #   @psycho = Psycho.find( params[:id])

  #   if @psycho.update( psycho_params )
  #     render :json => { :message => "Successfully updated"}
  #   else
  #     render :json => { :message => "Validate failed" }, :status => 400
  #   end
  # end

  def psycho_params
    params.permit(:title, :content, :message)
  end
end
