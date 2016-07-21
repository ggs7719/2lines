class ApiV1::PrenatalsController < ApiController

  before_action :authenticate_user!

  def index
    @prenatals = Prenatal.all
  end

  def create
    @prenatal = Prenatal.new( prenatal_params )

    if @prenatal.save
      render :json => { :message => "Successfully created"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def update
    @prenatal = Prenatal.find( params[:id])

    if @prenatal.update( prenatal_params )
      render :json => { :message => "Successfully updated"}
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def prenatal_params
    params.permit(:title, :content, :message)
  end
end
