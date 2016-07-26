class ApiV1::PrenatalsController < ApiController

  before_action :authenticate_user!

  def index
    @prenatals = Prenatal.where( :mother => current_user )
  end

  def create
    @prenatal = Prenatal.new( prenatal_params )
    @prenatal.mother = current_user

    f = Parent.find_by(:mother => current_user)
    @prenatal.father = f.father

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

  def destroy
    prenatal = Prenatal.find( params[:id] )
    prenatal.remove = true

    if prenatal.save
      render :json => { :message => "Successfully deleted",
                        :delete => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  def send_read
    prenatal = Prenatal.find( params[:id] )
    prenatal.status = true

    if prenatal.save
      render :json => { :message => "Already readed",
                        :read_status => true }
    else
      render :json => { :message => "Failed" }, :status => 400
    end
  end

  def prenatal_params
    params.permit(:title, :content, :message)
  end
end
